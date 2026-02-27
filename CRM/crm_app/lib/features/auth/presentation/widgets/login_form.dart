import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/constants/notify.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, AppRoutes.customers);
        }
        if (state is AuthError) {
          print(state.message);
          Notify.show(context, "Login Failed");
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "WELCOME BACK !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  cursorColor: Appcolors.milkyGreen,
                  decoration: InputDecoration(hintText: "Email"),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  cursorColor: Appcolors.milkyGreen,
                  decoration: InputDecoration(hintText: "Password"),
                ),

                SizedBox(height: 80),

                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signIn(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                  style: AppButtonStyles.topButton,
                  child: isLoading
                      ? CircularProgressIndicator(color: Appcolors.milkyGreen)
                      : Text(" LOGIN "),
                ),

                SizedBox(height: 20),
                Text("---------  OR  ---------"),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                  style: AppButtonStyles.bottomButton,
                  child: Text("Don't have an account ?"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
