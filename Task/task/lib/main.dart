import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/core/routes/appRoutes.dart';
import 'package:task/data/datasources/local_cache.dart';
import 'package:task/data/repositories/auth_repository_impl.dart';
import 'package:task/data/repositories/menu_repository_impl.dart';
import 'package:task/presentation/providers/auth_provider.dart';
import 'package:task/presentation/providers/menu_provider.dart';
import 'package:task/presentation/providers/orders_provider.dart';
import 'package:task/presentation/screens/admin/admin_profile_screen.dart';
import 'package:task/presentation/screens/admin/all_customers_screen.dart';
import 'package:task/presentation/screens/auth/login_screen.dart';
import 'package:task/presentation/screens/auth/signUp_screen.dart';
import 'package:task/presentation/screens/customers/home_screen.dart';
import 'package:task/presentation/screens/customers/orders_screen.dart';
import 'package:task/presentation/screens/customers/profile_screen.dart';
import 'package:task/presentation/screens/splash/splash.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  final cache = UserLocalCache();
  await cache.init();

  final authRepo = AuthRepositoryImpl(cache: cache);
  final menuRepo = MenuRepositoryImpl(FirebaseFirestore.instance);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppAuthProvider(authRepo)),
        ChangeNotifierProvider(create: (_) => MenuProvider(menuRepo)),
        ChangeNotifierProvider(create: (_) => OrdersProvider())
      ],
      child: MyNexotechApp(),
    ),
  );
}

class MyNexotechApp extends StatelessWidget {
  const MyNexotechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(409, 843),   // figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
        title: 'Nexotech',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (_) => SplashScreen(),
          AppRoutes.login: (_) => LoginScreen(),
          AppRoutes.signup: (_) => SignupScreen(),
      
          // Customer
          AppRoutes.home: (_) => HomeScreen(),
          AppRoutes.orders: (_) => OrdersScreen(),
          AppRoutes.profile: (_) => ProfileScreen(),
      
          // Admin
          AppRoutes.allCustomers: (_) => AllCustomersScreen(),
          AppRoutes.adminProfile: (_) => AdminProfileScreen(),
        },
        theme: ThemeData(
          fontFamily: "Verdana"
        )
      );
  }
    );
  }
}
