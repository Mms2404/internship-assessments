import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/domain/entities/menu_entity.dart';

class MenuModel extends MenuEntity {
  const MenuModel({
    required super.name,
    required super.hotel,
    required super.ratings,
    required super.image,
  });

  factory MenuModel.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String , dynamic>;
    return MenuModel(
      name: map['name'] ?? '',
      hotel: map['hotel'] ?? '',
      ratings: map['ratings'] ?? '',
      image: map['image'] ?? '',
    );
  }

  
}
