import 'package:task/domain/entities/app_user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required super.uid,
    required super.email,
    super.name,
    required super.role,
  });

  ///  from Firestore
  factory AppUserModel.fromMap(String id, Map<String, dynamic> data) {
    return AppUserModel(
      uid: id, // firestore doc ID
      email: data['email'] as String,
      name: data['name'] as String?,
      role: (data['role'] == 'admin') ? UserRole.admin : UserRole.customer,
    );
  }

  /// to Firestore 
  @override
  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'role': role.name,
      };
}
