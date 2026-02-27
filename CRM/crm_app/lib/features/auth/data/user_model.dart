import 'package:crm_app/features/auth/domain/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({ required super.uid , required super.email });

  factory UserModel.fromFirebaseUser(dynamic user){
    return UserModel(
      uid: user.uid, 
      email: user.email ?? '');
  }
}