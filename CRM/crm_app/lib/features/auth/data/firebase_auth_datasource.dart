import 'package:crm_app/features/auth/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDatasource {
  Future<UserModel> signIn(String email , String password);
  Future<UserModel> signUp(String email , String password);
}

class FirebaseAuthDatasourceImpl implements FirebaseAuthDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDatasourceImpl(this.firebaseAuth);
  
  @override
  Future<UserModel> signIn(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password);

    final user = result.user!;
    return UserModel.fromFirebaseUser(user);
  }
  
  @override
  Future<UserModel> signUp(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password);

    final user = result.user!;
    return UserModel.fromFirebaseUser(user);
  }

  
}