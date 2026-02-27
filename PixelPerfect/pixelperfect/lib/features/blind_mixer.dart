import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';
import 'package:pixelperfect/features/subscription.dart';

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peace,
      appBar: AppBar(
        backgroundColor: AppColors.peace,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Blind Mixer",
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
                      MaterialPageRoute(builder: (context) => SubscriptionScreen() )
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
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 10.h,),
                Image.asset("assets/images/blind.png",
                height: 240.h,
                width: 240.w,
                ),
        
                const SizedBox(height: 28),
        
                Text(
                  "Upcoming Blind Date",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
        
                const SizedBox(height: 8),
                Text(
                  "Let Mixer surprise you with a match.",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
        
                const SizedBox(height: 16), 
                FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.peace,
                        fixedSize: Size(225.w, 36.h),
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(39.r),
                         side: BorderSide(
                          color: Color(0xFFFFEFF0)
                         )
                      ),
                      ),
                      onPressed: (){}, 
                      child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/calender.png" ,
                     height: 15.36.h,
                     width: 15.36.w,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "September 28 - 10 PM",
                      style: TextStyle(
                        color: AppColors.blacky,
                        fontFamily: "Manrope",
                        fontSize: 14.8.sp,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                ) ,                                             
                
                SizedBox(height: 20.h,),
                Divider(
                  color: Color(0xFFFFEFF0),
                  indent: 40.w,
                  endIndent: 40.w,
                ),
                const SizedBox(height: 50),
                !isApplied
                ? Text(" Sign Up  •  Smart Match  •  Blind Date",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Manrope",
                  color: AppColors.appPurple
                 ),
                )
                : Text(""),
        
                const SizedBox(height: 20),

                !isApplied 
                ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isApplied = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appPurple,
                    minimumSize: Size(361.w, 50.h),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39.sp),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/form.png",
                      height: 18.h,
                      width: 18.w,
                     ),
                     SizedBox(width: 10.w,),
                     Text("Fill out the Form",
                      style:TextStyle(
                        fontSize: 16.sp, 
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                     ),
                    ],
                  )
                )

                : FilledButton(
                  onPressed: () {
                    setState(() {
                      isApplied = false;
                    });
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.peace,
                    minimumSize: Size(361.w, 50.h),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39.sp),
                      side: BorderSide(color: Color(0xFFECD3E8))
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/tick.png",
                      height: 18.h,
                      width: 18.w,
                     ),
                     SizedBox(width: 10.w,),
                     Text("Applied for Blind Mixer",
                      style:TextStyle(
                        fontSize: 16.sp, 
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.w600,
                        color: AppColors.appPurple),
                     ),
                    ],
                  )
                ),
              ],
            ),
      )
    );
  }
}




