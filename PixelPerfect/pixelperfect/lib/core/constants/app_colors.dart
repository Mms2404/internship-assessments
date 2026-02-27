import 'package:flutter/material.dart';

class AppColors {
  static const Color appPurple = Color(0xFF5E1053);
  static const Color brown = Color(0xFF5B3700);
  static const Color orange = Color(0xFFA16000);
  static const Color grey = Color(0xFF6E6F73);
  static const Color blacky = Color(0xFF22242B);
  static const Color peace = Colors.white;

   static const LinearGradient pinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE50004),
      Color(0xFF880078),
    ],
    transform: GradientRotation(281.76 * 3.1416 / 180), 
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA96F18),
      Color(0xFFD59331),
    ],
    transform: GradientRotation(280.85 * 3.1416 / 180),
  );
}
