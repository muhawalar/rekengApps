import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/background/on_boarding.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Rekeng',
            style: TextStyle(
                fontFamily: 'Lontara', fontSize: 50, color: ColorApp.primary),
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28),
            child: Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ColorApp.primary.withOpacity(0.7)),
              child: Center(
                child: Text(
                  'Get Started',
                  style: FontStyle.heading4,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: FontStyle.dropdownValue,
              ),
              TextButton(
                  child: Text(
                    'Log In',
                    style: FontStyle.countValue,
                  ),
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
