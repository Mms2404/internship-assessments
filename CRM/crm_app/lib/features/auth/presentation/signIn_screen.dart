import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/core/widgets/appDialog.dart';
import 'package:crm_app/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 220),
              Image.asset("assets/logo.png", height: 200, width: 500),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context,
                    LoginForm(),
                  );
                },
                style: AppButtonStyles.topButton,
                child: Text("LOGIN"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.viewOnly);
                },
                style: AppButtonStyles.bottomButton,
                child: Text("View-Only"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
