import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/core/widgets/appTextField.dart';
import 'package:crm_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.day,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signIn);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSignUpSuccess){
              Navigator.pushReplacementNamed(context, AppRoutes.signIn);
              Notify.show(context, " Created a new account . Login now !");
            }
            if (state is AuthError){
              Navigator.pushReplacementNamed(context, AppRoutes.signIn);
              Notify.show(context, " Failed to create an account . Try Again");
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CREATE AN ACCOUNT",
                  style: TextStyle(fontSize: 30, color: Appcolors.milkyGreen),
                ),
                SizedBox(height: 20),
                AppTextField(
                  controller: emailController,
                  labelText: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                AppTextField(
                  controller: passwordController,
                  labelText: "Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Set a password of atleast 6 characters ";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 50),
                state is AuthLoading
                ? CircularProgressIndicator(color: Appcolors.night,)
                : ElevatedButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    context.read<AuthCubit>().signUp(email, password);
                  },
                  style: AppButtonStyles.commonButton,
                  child: Text("SIGN UP"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
