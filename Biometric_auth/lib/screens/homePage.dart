import 'package:biometric_auth/constants/colors.dart';
import 'package:biometric_auth/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void notify(BuildContext context , String msg){
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text("INFO"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text("OK" , style: TextStyle(color: AppColors.orange)))
        ],
      )
    );
  }

  void logout(BuildContext context) async {
    final authService = BiometricAuthService();
    await authService.clearToken();
    Navigator.pushNamed(context, '/login');
    notify(context, "Logged out succesfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Center(
        child: LottieBuilder.asset("assets/welcome.json")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logout(context),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.orange,
        tooltip: "Logout",
        child: Icon(Icons.logout_sharp),
      ),
    );
  }
}