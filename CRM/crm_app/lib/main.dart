import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/features/auth/auth_injection.dart';
import 'package:crm_app/features/customers/firestore_service.dart';
import 'package:crm_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyCrm());
}

class MyCrm extends StatelessWidget {
  const MyCrm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AppFirestoreService())
      ],
      child: BlocProvider(
        create: (context) => AuthInjection.provide(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "CRM App",
          theme: ThemeData(fontFamily: 'Rockwell'),
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes
        ),
      )
    );
  }
}
