import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task/data/datasources/local_cache.dart';
import 'package:task/data/models/app_user_model.dart';
import 'package:task/domain/entities/app_user.dart';
import 'package:task/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  final UserLocalCache _cache;
  GoogleSignIn _googleSignIn;

  AuthRepositoryImpl({
    FirebaseAuth? auth,
    FirebaseFirestore? db,
    required UserLocalCache cache,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _db = db ?? FirebaseFirestore.instance,
        _cache = cache,
        _googleSignIn = googleSignIn ?? GoogleSignIn(scopes: ['email', 'profile']);

  // ---------------- LOGIN ----------------
  @override
  Future<AppUser?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);

    // For email login → respect existing Firestore role (could be admin or customer)
    final user = await _ensureUserDoc(cred.user!, allowExistingRole: true);

    await _cache.put(user);
    return user;
  }

  // ---------------- SIGNUP ----------------
  @override
  Future<AppUser?> signup(String email, String password, String displayName) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    // Always a customer
    final doc = {
      'uid': cred.user!.uid,
      'email': email,
      'name': displayName,
      'role': 'customer',
    };
    await _db.collection('users').doc(cred.user!.uid).set(doc, SetOptions(merge: true));

    final user = AppUserModel.fromMap(cred.user!.uid, doc);
    await _cache.put(user);
    return user;
  }

  // ---------------- GOOGLE LOGIN ----------------
  @override
  Future<AppUser?> loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null; // cancelled
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final cred = await _auth.signInWithCredential(credential);

    // Always customer
    final user = await _ensureUserDoc(cred.user!, forceCustomer: true);

    await _cache.put(user);
    return user;
  }

  // ---------------- CURRENT USER ----------------
  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) {
      return _cache.get();
    }
    final doc = await _db.collection('users').doc(firebaseUser.uid).get();
    if (!doc.exists) return null;

    final user = AppUserModel.fromMap(doc.id, doc.data()!);
    await _cache.put(user);
    return user;
  }

  // ---------------- LOGOUT ----------------
  @override
  Future<void> logout() async {
    await _auth.signOut();
    await _cache.clear();
    try {
      await GoogleSignIn().signOut();
    } catch (_) {}
  }

  // ---------------- PRIVATE HELPER ----------------
  Future<AppUser> _ensureUserDoc(
    User firebaseUser, {
    bool allowExistingRole = false,
    bool forceCustomer = false,
  }) async {
    final ref = _db.collection('users').doc(firebaseUser.uid);
    final snap = await ref.get();

    if (snap.exists) {
      final data = snap.data()!;
      // If role already exists in Firestore, just use it
      return AppUserModel.fromMap(snap.id, data);
    }

    // If doc does not exist, create new one
    final doc = {
      'uid': firebaseUser.uid,
      'email': firebaseUser.email ?? '',
      'name': firebaseUser.displayName,
      'role': forceCustomer ? 'customer' : 'customer', // default always customer
    };

    await ref.set(doc, SetOptions(merge: true));
    return AppUserModel.fromMap(firebaseUser.uid, doc);
  }
}
