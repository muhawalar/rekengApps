import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
