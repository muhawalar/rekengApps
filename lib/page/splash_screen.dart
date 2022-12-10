import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/on_boarding.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        final model = Provider.of<RekengProvider>(context);
        if (model.isUser == true) {
          return HomePageBottomBar();
        } else {
          return OnBoardingPage();
        }
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Center(
        child: Text(
          'Rekeng',
          style: TextStyle(
              fontFamily: 'Lontara', fontSize: 50, color: ColorApp.white),
        ),
      ),
    );
  }
}
