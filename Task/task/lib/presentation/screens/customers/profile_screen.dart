import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appButtonStyles.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/presentation/providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user = context.watch<AppAuthProvider>().user;

    return Scaffold(
      backgroundColor: Appcolors.day,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text("Hello, ${user?.name ?? 'my friend'} ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 30,),
              ElevatedButton(
              style: AppButtonStyles.commonButton,
              onPressed: (){
                context.read<AppAuthProvider>().logout(context);
              }, 
              child: Text("LOGOUT")),
            ]
        ),
      ),
    );
  }
}