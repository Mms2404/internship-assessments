import 'package:flutter/material.dart';
import 'package:task/core/constants/appColors.dart';

class AppButtonStyles {

static ButtonStyle topButton = ElevatedButton.styleFrom(
      backgroundColor: Appcolors.spice,
      foregroundColor: Appcolors.day,
      fixedSize: Size(330, 56),     
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  

static ButtonStyle bottomButton = ElevatedButton.styleFrom(
      backgroundColor: Appcolors.spice,
      foregroundColor: Appcolors.day,
      fixedSize: Size(330, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(10),
        ),
      ),
    );

static ButtonStyle commonButton= ElevatedButton.styleFrom(
      backgroundColor: Appcolors.night,
      foregroundColor: Appcolors.spice,
      minimumSize: Size(330, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    );


}