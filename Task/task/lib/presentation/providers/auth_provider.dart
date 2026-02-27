import 'package:flutter/material.dart';
import 'package:task/core/routes/appRoutes.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AppAuthProvider extends ChangeNotifier {
  final AuthRepository repo;
  AppUser? _user;

  AppUser? get user => _user;

  AppAuthProvider(this.repo);

  Future<void> tryRestoreSession(BuildContext context) async {
    _user = await repo.getCurrentUser();
    notifyListeners();
    _navigateFromUser(context);
  }

  Future<void> login(String email, String password, BuildContext context) async {
    _user = await repo.login(email, password);
    notifyListeners();
    _navigateFromUser(context);
  }

  Future<void> signup(String email, String password, String name, BuildContext context) async {
    _user = await repo.signup(email, password, name);
    notifyListeners();
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    _user = await repo.loginWithGoogle();
    notifyListeners();
    _navigateFromUser(context);
  }

  Future<void> logout(BuildContext context) async {
    await repo.logout();
    _user = null;
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
  }

  void _navigateFromUser(BuildContext context) {
    if (_user == null) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
      return;
    }
    if (_user!.role == UserRole.admin) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.allCustomers, (_) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
    }
  }
}
