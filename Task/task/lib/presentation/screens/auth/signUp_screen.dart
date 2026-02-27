import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appButtonStyles.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/core/constants/validators.dart';
import 'package:task/core/widgets/appTextField.dart';
import 'package:task/presentation/providers/auth_provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final nameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.day,
        title: Text("SIGN UP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.jpeg",
                  height: 150.h,
                  width: 150.w,),
                SizedBox(height: 20,),
                AppTextField(
                  controller: nameController , 
                  labelText: "Name",
                  validator: (value) => notEmpty(value, "Name"),
                ),
                AppTextField(
                  controller: emailcontroller , 
                  labelText: "Email",
                  validator: (value) => notEmpty(value, "Email")
                ),
                AppTextField(
                  controller: passwordController , 
                  labelText: "Password",
                  validator: (value) => notEmpty(value, "Password")
                ),
                SizedBox(height: 50,),
            
                ElevatedButton(
                  style: AppButtonStyles.commonButton,
                  onPressed: (){
                    if ( formKey.currentState!.validate()){
                      final name = nameController.text.trim();
                      final email = emailcontroller.text.trim();
                      final password = passwordController.text.trim();
            
                      context.read<AppAuthProvider>().signup(email, password, name, context);
                    }
                  }, 
                  child: Text("SIGN UP"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}