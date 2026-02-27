import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appButtonStyles.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/core/routes/appRoutes.dart';
import 'package:task/core/widgets/appDialog.dart';
import 'package:task/core/widgets/appTextField.dart';
import 'package:task/presentation/providers/auth_provider.dart';
import 'package:task/presentation/screens/auth/widgets/admin_login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AppAuthProvider>();

    return Scaffold(
      backgroundColor: Appcolors.day,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Image.asset("assets/logo.jpeg",
                height: 180.h,
                width: 180.w,),
                SizedBox(height: 10,),

                AppTextField(
                  controller: emailcontroller, 
                  labelText: 'Email'),
                SizedBox(height: 15),

                AppTextField(
                  controller: passwordController, 
                  obscureText: true,
                  labelText: 'Password'),
                SizedBox(height: 30),

                ElevatedButton(
                  style: AppButtonStyles.topButton,
                  onPressed: () => auth.login(
                    emailcontroller.text.trim(), 
                    passwordController.text, 
                    context), 
                  child: Text("LOGIN")),
                SizedBox(height: 15),

                ElevatedButton(
                  style: AppButtonStyles.bottomButton,
                  onPressed: (){
                    auth.loginWithGoogle(context);
                  }, 
                child: Text("Continue with GOOGLE")),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: (){
                   Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text("New ? Create an account here !")),
                const SizedBox(height: 20),
                
                ElevatedButton(
                  style: AppButtonStyles.commonButton,
                  onPressed: (){
                    AppDialog.show(context, AdminLoginForm());
                  }, 
                  child: Text("ADMIN LOGIN"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
