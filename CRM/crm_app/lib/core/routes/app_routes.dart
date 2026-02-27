import 'package:crm_app/features/auth/presentation/signIn_screen.dart';
import 'package:crm_app/features/auth/presentation/signUp_screen.dart';
import 'package:crm_app/features/customers/presentation/addCustomer.dart';
import 'package:crm_app/features/customers/presentation/customers.dart';
import 'package:crm_app/features/splash/splash_screen.dart';
import 'package:crm_app/features/view-only/viewOnly_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {

  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String viewOnly = '/random-company';
  static const String customers = '/customers';
  static const String addCustomer = '/add-customer';

  static Map<String , WidgetBuilder> routes = {
    splash : (context) => SplashScreen(),
    signIn : (context) => SigninScreen(),
    signUp : (context) => SignupScreen(),
    viewOnly : (context) => RandomCompany(),
    customers: (context) => Customers(),
    addCustomer : (context) => AddCustomer(),
  };
}