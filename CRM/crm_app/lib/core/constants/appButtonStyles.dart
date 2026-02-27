import 'package:crm_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {

static ButtonStyle topButton = ElevatedButton.styleFrom(
      backgroundColor: Appcolors.night,
      foregroundColor: Appcolors.milkyGreen,
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
      backgroundColor: Appcolors.night,
      foregroundColor: Appcolors.milkyGreen,
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
      foregroundColor: Appcolors.milkyGreen,
      minimumSize: Size(330, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    );


}