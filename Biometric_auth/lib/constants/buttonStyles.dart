import 'package:biometric_auth/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButtonStyles{
static ButtonStyle commonButton= ElevatedButton.styleFrom(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.orange,
      minimumSize: Size(330, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    );
}