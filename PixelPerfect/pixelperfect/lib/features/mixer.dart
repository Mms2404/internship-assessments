import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelperfect/core/constants/app_button_styles.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';
import 'package:pixelperfect/features/subscription.dart';

class MixerScreen extends StatefulWidget {
  const MixerScreen({super.key});

  @override
  State<MixerScreen> createState() => _MixerScreenState();
}

class _MixerScreenState extends State<MixerScreen> {
  bool isFiltered = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peace,
      appBar: AppBar(
        backgroundColor: AppColors.peace,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mixer",
             style: TextStyle(
              letterSpacing: -1.w,
              fontFamily: "Onest",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
             ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => SubscriptionScreen())
                    );
                  },
                  child: Image.asset("assets/icons/appBarIcons/subscription.png" , height:24.h,width: 24.w,)
                ),
                SizedBox(width: 15,),
                Image.asset("assets/icons/appBarIcons/bell.png" , height:24.h,width: 24.w,)
              ],
            )
          ],
        ),
        
      ),
      body:Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10.w,),
                  SizedBox(
                    height: 38.h,
                     width: 120.w,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: isFiltered
                          ?  const Color.fromARGB(28, 94, 16, 84)
                          : Color(0xFFF8F8F8)
                      ),
                      onPressed: (){
                        setState(() {
                          isFiltered = !isFiltered;
                        });
                      }, 
                      icon: Image.asset("assets/icons/filter.png", height: 20.h,width: 20.h,),
                      label: Text("Filters", style: AppButtonStyles.textStyle1,)),
                  ),
                  SizedBox(width: 5.w,),
                  SizedBox(
                    height: 38.h,
                    width: 90.w,
                    child: DropdownButtonFormField<String>(
                      decoration: AppButtonStyles.drop.copyWith(hintText: "Age"),
                      icon: Image.asset("assets/icons/drop.png", height: 20.h,width: 20.h,),
                      style: AppButtonStyles.textStyle,
                      items:[],
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SizedBox(
                    height: 38.h,
                    width: 110.w,
                    child: DropdownButtonFormField<String>(
                      decoration: AppButtonStyles.drop.copyWith(hintText: "Height"),
                      icon: Image.asset("assets/icons/drop.png", height: 20.h,width: 20.h,),
                      style: AppButtonStyles.textStyle,
                      items:[],
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SizedBox(
                    height: 38,
                    width: 110,
                    child: DropdownButtonFormField<String>(
                      decoration: AppButtonStyles.drop.copyWith(hintText: "Habit"),
                      icon: Image.asset("assets/icons/drop.png", height: 20.h,width: 20.h,),
                      style: AppButtonStyles.textStyle,
                      items: const [],
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 5.w,),
                ],
              ),
            ),
          ),
          SizedBox(height: 130.h,),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: SizedBox(
              width: 352.w,
              height: 282.77.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/mixer.png" , height: 96.77.h, width: 207.36.w,),
                  Text(isFiltered
                    ? "You’ve seen them all"
                    : "You’ve seen everyone nearby",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700
                   ),
                  ),
                  Text(isFiltered
                   ? "No more profiles match your filters. Update your preferences to find more people."
                   : "No more profiles in your area. Check back later or expand your location to see more people.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500
                   ),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: AppButtonStyles.small, 
                    child: Text("Adjust Location",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700
                    ),)),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}