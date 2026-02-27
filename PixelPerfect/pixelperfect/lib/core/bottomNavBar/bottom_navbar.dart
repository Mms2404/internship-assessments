import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelperfect/core/constants/app_colors.dart';
import 'package:pixelperfect/features/blind_mixer.dart';
import 'package:pixelperfect/features/heart.dart';
import 'package:pixelperfect/features/mixer.dart';
import 'package:pixelperfect/features/profile.dart';
import 'package:pixelperfect/features/together.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    MixerScreen(),
    HeartScreen(),
    TogetherScreen(),
    BlindMixerScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 83.h,
        child: BottomNavigationBar(
          backgroundColor: AppColors.peace,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/navIcons/nav1.png",height: 24.h, width: 24.w,),
              activeIcon: Image.asset("assets/icons/navIcons/active1.png",height: 44.h, width: 44.w, ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/navIcons/nav2.png",height: 24.h, width: 24.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/navIcons/nav3.png",height: 24.h, width: 24.w,),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/navIcons/nav4.png",height: 24.h, width: 24.w,),
              activeIcon: Image.asset("assets/icons/navIcons/active4.png",height: 44.h, width: 44.w, ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon:Image.asset("assets/icons/navIcons/nav5.png",height: 24.h, width: 24.w,),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
