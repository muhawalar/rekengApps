import 'package:flutter/material.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/loginregister/register.dart';
import 'package:rekeng_apps/page/outcome/detail_outcome.dart';
import 'package:rekeng_apps/page/scan/scan_ai.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/transaction/neraca_saldo.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RekengProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageBottomBar(),
      ),
    );
  }
}
