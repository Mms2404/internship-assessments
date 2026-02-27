import 'package:flutter/material.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';

class TogetherScreen extends StatelessWidget {
  const TogetherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peace,
      body: Center(
        child: Text("TogetherScreen"),
      ),
    );
  }
}