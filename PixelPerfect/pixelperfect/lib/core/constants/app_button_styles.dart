import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';

class AppButtonStyles {
  static ButtonStyle small = ElevatedButton.styleFrom(
    backgroundColor: AppColors.appPurple, 
    foregroundColor: AppColors.peace,
    minimumSize: Size(200.w, 42.h),
    padding: EdgeInsets.symmetric(
      horizontal: 70.w,
      vertical: 7.h,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(39.r),
    ),
    elevation: 0,
  );

  static ButtonStyle large = ElevatedButton.styleFrom(
    backgroundColor: AppColors.appPurple,
    foregroundColor: AppColors.peace,
    minimumSize: Size(361.w, 50.h),
    padding: EdgeInsets.symmetric(
      horizontal: 70.w,
      vertical: 7.h,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(39.r),
    ),
    elevation: 0,
  );

  static InputDecoration drop = InputDecoration(
  hintText: "",
  hintStyle: AppButtonStyles.textStyle,
  contentPadding:EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
  filled: true,
  fillColor: const Color(0xFFF8F8F8),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Color(0xFFF8F8F8),),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Color(0xFFF8F8F8),),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Color(0xFFF8F8F8),),
  ),
);




  // common text style
  static TextStyle textStyle =TextStyle(
    fontFamily: "Manrope",
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle textStyle1 =TextStyle(
    fontFamily: "Manrope",
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.appPurple
  );
}
