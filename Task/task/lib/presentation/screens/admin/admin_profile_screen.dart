import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appButtonStyles.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/core/routes/appRoutes.dart';
import 'package:task/presentation/providers/auth_provider.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.day,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, AppRoutes.allCustomers);
          }, icon: Icon(IconlyBold.arrow_left_2), color: Appcolors.spice,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text("Hello ADMIN ",
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