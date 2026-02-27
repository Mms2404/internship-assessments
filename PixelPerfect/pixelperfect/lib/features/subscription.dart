import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';
import 'package:pixelperfect/features/widgets/subscription_buttons.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  bool vipPressed = true;
  bool vvipPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peace,
      body: Container(
        decoration: vvipPressed
         ? BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF9E0A4),
          AppColors.peace, 
        ],
        stops: [0.0, 0.2],
        ),
       )
       : BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFCE7F3),
          AppColors.peace, 
        ],
        stops: [0.0, 0.2],
        ),
       ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.only(top: 25.h),
                child: Row(
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
                            GestureDetector(
                onTap: (){ 
                  Navigator.pop(context);
                },
                child: Image.asset("assets/icons/exit.png",height: 24.h,width:24.w)
                            )
                          ],
                          ),
              ),
              SizedBox(height: 40.h,),
              Text("Level Up Your Mixer Experience",
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
                color: vvipPressed 
                ? AppColors.orange
                : AppColors.appPurple
              ),
             ),
             SizedBox(height: 50.h,),
             Text("Select a plan",
             style: TextStyle(
              color: AppColors.grey,
              fontFamily: "Manrope",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
             ),),
             SizedBox(height: 30.h,),
             Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      vipPressed = true;
                      vvipPressed = false;
                    });
                  },
                  child: Container(
                    width: 168.w,
                    height: 146.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: vipPressed ? Color(0xFFFCE7F3):Color(0xFFF8F8F8)),
                      borderRadius: BorderRadius.circular(16.sp)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Mixer",
                                  style: TextStyle( 
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blacky,
                                    fontSize: 16.sp,),
                                  ),
                                  Text("\$24.99",
                                  style: TextStyle(
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26.sp,
                                    color: AppColors.appPurple
                                   ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 18.w,),
                              Image.asset("assets/images/vip.png", height: 35.2.h,width: 35.2.w,)
                            ],
                          ),
                          SizedBox(height: 40.h,),
                          Text("All of the below",
                          style:TextStyle(
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp
                           ) ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      vvipPressed = true;
                      vipPressed = false;
                    });
                  },
                  child: Container(
                    width: 168.w,
                    height: 146.h,
                    decoration: BoxDecoration(
                      color: vvipPressed ? Color(0xFFF9E0A4).withOpacity(0.1) : null,
                      border: Border.all(color: vvipPressed ? Color(0xFFF9E0A4):Color(0xFFF8F8F8)),
                      borderRadius: BorderRadius.circular(16.sp)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Mixer VIP",
                                  style: TextStyle( 
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blacky,
                                    fontSize: 16.sp,),
                                  ),
                                  Text("\$99.99",
                                  style: TextStyle(
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26.sp,
                                    color: AppColors.appPurple
                                   ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 18.w,),
                              Image.asset("assets/images/vvip.png", height: 35.2.h,width: 35.2.w,)
                            ],
                          ),
                          SizedBox(height: 21.h,),
                          Text("All 3 + VIP seating, food, and beverages",
                          style:TextStyle(
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp
                           ) ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
             ),
             SizedBox(height: 60.h,),

             vipPressed
             ? Stack(
              clipBehavior: Clip.none,
               children: [
                 Container(
                   width: 350.w,
                   height: 190.h,
                   decoration: BoxDecoration(
                     border: Border.all(color:Color(0xFFFCE7F3)),
                     borderRadius: BorderRadius.circular(8.sp)
                   ),
                   child: Padding(
                     padding: EdgeInsets.only(top: 25.h,right: 25.w, left: 25.w,bottom: 0),
                     child: Column(
                       children: [
                         _bulletPoint("Unlimited Likes"),
                         _bulletPoint("See who liked you"),
                         _bulletPoint("Find people with wide range"),
                         _bulletPoint("Access to events"),
                       ],
                     ),
                   ),
                 ),
                 Positioned(
                      top: -14.h, 
                      left: 90.w, 
                      child: Container(
                        height: 27.44.h,
                        width: 163.w,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color:Color(0xFFFCE7F3)),
                         ),
                        child: Center(
                           child: Text(
                                "Included with Mixer VIP",
                                style: TextStyle(
                                   fontFamily: "Manrope",
                                   fontWeight: FontWeight.w600,
                                   fontSize: 12.sp,
                                ),
                             ),
                         ),
                        ),
                       ),
               ],
             )
             : Stack(
              clipBehavior: Clip.none,
                 children: [
                  Container(
                    width: 350.w,
                    height: 230.h,
                    decoration: BoxDecoration(
                       border: Border.all(color: Color(0xFFF9E0A4)),
                       borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 25.h, right: 25.w, left: 25.w, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _bulletPoint1("Unlimited Likes"),
                            _bulletPoint1("See who liked you"),
                            _bulletPoint1("Find people with wide range"),
                            _bulletPoint1("Access to events"),
                            _bulletPoint1("VIP seating, food & beverages"),
                          ],
                        ),
                      ),
                     ),

                   Positioned(
                      top: -14.h, 
                      left: 90.w, 
                      child: Container(
                        height: 27.44.h,
                        width: 163.w,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Color(0xFFFFE5BE)),
                         ),
                        child: Center(
                           child: Text(
                                "Included with Mixer VIP",
                                style: TextStyle(
                                   fontFamily: "Manrope",
                                   fontWeight: FontWeight.w600,
                                   fontSize: 12.sp,
                                ),
                             ),
                         ),
                        ),
                       ),
                      ],
                     ),

             vipPressed
             ? SizedBox(height: 60.h,)
             : SizedBox(height: 40.h,),

             vipPressed
             ? GradientButton1(text: "Continue – \$24.99 total", onPressed: (){})
             : GradientButton2(text: "Continue – \$99.99 total", onPressed: (){}),

             SizedBox(height: 20.h,),
             Text("By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer’s Terms.",
             textAlign: TextAlign.center,
             style: TextStyle(
              fontFamily: "Manrope",
              fontWeight: FontWeight.w300,
              color: AppColors.grey,
              fontSize: 10.sp
             ),),

             
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletPoint(String text) {
  return Padding(
    padding:EdgeInsets.only(bottom: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/tick1.png", 
          height: 20.h,
          width: 20.h,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _bulletPoint1(String text) {
  return Padding(
    padding:EdgeInsets.only(bottom: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/tick2.png", 
          height: 20.h,
          width: 20.h,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}

}