import 'package:flutter/material.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peace,
      body: Center(
        child: Text("HeartScreen"),
      ),
    );
  }
}