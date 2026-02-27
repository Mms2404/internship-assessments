import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/menu_model.dart';

class MenuRepositoryImpl {
  final FirebaseFirestore firestore;

  MenuRepositoryImpl(this.firestore);

  Stream<List<MenuModel>> getMenu() {
    // Return the snapshot as a Stream, always.
    return firestore.collection("menu").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => MenuModel.fromMap(doc)).toList();
    });
  }
}
