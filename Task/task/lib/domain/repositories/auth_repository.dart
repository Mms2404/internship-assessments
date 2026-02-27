import 'package:task/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> login(String email, String password);
  Future<AppUser?> signup(String email, String password, String name);
  Future<AppUser?> loginWithGoogle(); // ./gradlew signingReport
  Future<AppUser?> getCurrentUser();
  Future<void> logout();
}
