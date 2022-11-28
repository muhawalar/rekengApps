import 'package:flutter/material.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/income/detail_income.dart';
import 'package:rekeng_apps/page/income/income.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/loginregister/register.dart';
import 'package:rekeng_apps/page/on_boarding.dart';
import 'package:rekeng_apps/page/outcome/detail_outcome.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/splash_screen.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
