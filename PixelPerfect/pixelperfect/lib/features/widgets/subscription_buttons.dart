import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton1({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 360.w,
        height: 48.h,
        padding: EdgeInsets.symmetric(
          horizontal: 52.w,
          vertical: 11.h,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(281.76 * 3.1416 / 180),
            colors: [
              Color(0xFFE50004),
              Color(0xFF880078),
            ],
          ),
          borderRadius: BorderRadius.circular(39.r),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/ip.png", height: 23.h,width: 26.w,),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class GradientButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton2({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 360.w,
        height: 48.h,
        padding: EdgeInsets.symmetric(
          horizontal: 52.w,
          vertical: 11.h,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(281.76 * 3.1416 / 180), 
            colors: [
              Color(0xFFA96F18),
              Color(0xFFD59331),
            ],
          ),
          borderRadius: BorderRadius.circular(39.r),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/ip.png", height: 23.h,width: 26.w,),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
