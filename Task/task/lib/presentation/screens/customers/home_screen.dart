import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/presentation/screens/customers/menu_screen.dart';
import 'package:task/presentation/screens/customers/orders_screen.dart';
import 'package:task/presentation/screens/customers/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentScreen = 0;
  final List<Widget> screens = [
    MenuScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    extendBody: true,
    body: screens[currentScreen],
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: BottomNavigationBar(
          
          backgroundColor: Colors.white,
          selectedItemColor: Appcolors.night,
          unselectedItemColor: Colors.grey,
          currentIndex: currentScreen,
          onTap: (index) {
            setState(() {
              currentScreen = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: currentScreen == 0
                  ? Icon(IconlyBold.home)
                  : Icon(IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: currentScreen == 1
                  ? Icon(IconlyBold.bag)
                  : Icon(IconlyLight.bag),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: currentScreen == 2
                  ? Icon(IconlyBold.profile)
                  : ImageIcon(
          AssetImage("assets/user.png"),
          size: 24,
          color: Colors.grey, // 👈 same as unselectedItemColor
        ),
              label: "Profile",
            ),
          ],
        ),
      ),
    ),
  );
}
}