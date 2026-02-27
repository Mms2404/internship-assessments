import 'package:biometric_auth/constants/buttonStyles.dart';
import 'package:biometric_auth/constants/colors.dart';
import 'package:biometric_auth/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void notify(BuildContext context , String msg){
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text("INFO"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text("OK" , style: TextStyle(color: AppColors.orange),))
        ],
      )
    );
  }

  void handleAuth(BuildContext context) async {
    
    final authService = BiometricAuthService();
    final isBiometricAvailable = await authService.isBiometricAvailable();
    final availableBiometrics = await authService.getAvailableBiometrics();
    final isAuthenticated = await authService.authenticateUser(
      reason: "Login using biometrics or device pin");


    if(!isBiometricAvailable){
      notify(context, "Biometric or PIN not available");
      return;
    }

    if(availableBiometrics.contains(BiometricType.fingerprint)){
      print("Fingerprint available");
    }
    else if(availableBiometrics.contains(BiometricType.face)){
      print("Face ID available");
    }
    else{
      print("Only device credentials are available ( PIN / pswd )");
    }


    if(isAuthenticated){
      Navigator.pushNamed(context,'/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.screenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/logo.png")
              )
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              handleAuth(context);
            }, 
            style: AppButtonStyles.commonButton,
            child: Text("LOGIN")
          ),
        ],
      )
    );
  }
}