import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/appButtonStyles.dart';
import 'package:task/core/widgets/appTextField.dart';
import 'package:task/presentation/providers/auth_provider.dart';

class AdminLoginForm extends StatefulWidget {
  @override
  _AdminLoginFormState createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ADMIN LOGIN", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
      
          AppTextField(
            controller: _emailController,
            labelText: "Email",
          ),
          AppTextField(
            controller: _passwordController,
            labelText: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 60),
          ElevatedButton(
            style: AppButtonStyles.commonButton,
            onPressed: () async {
              await context.read<AppAuthProvider>().login(
                _emailController.text.trim(),
                _passwordController.text.trim(),
                context,
              );
              Navigator.of(context).pop(); 
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
