import 'package:flutter/material.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/income/detail_income.dart';
import 'package:rekeng_apps/page/income/form_invoice.dart';
import 'package:rekeng_apps/page/income/income.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/loginregister/register.dart';
import 'package:rekeng_apps/page/on_boarding.dart';
import 'package:rekeng_apps/page/outcome/detail_outcome.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/splash_screen.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:firebase_core/firebase_core.dart';

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
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
