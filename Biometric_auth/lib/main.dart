import 'package:biometric_auth/screens/homePage.dart';
import 'package:biometric_auth/services/authService.dart';
import 'package:flutter/material.dart';
import 'screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final BiometricAuthService authService = BiometricAuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biometric Auth App',
      routes: {
        '/login':(context) => LoginPage(),
        '/home': (context) => Homepage(),
      },
      home: FutureBuilder(
        future: authService.getToken(), 
        builder: (context ,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: Text("Loading ... "),);
          }
          final token = snapshot.data;
          return token != null ? Homepage() : LoginPage();
        }),
    );
  }
}

