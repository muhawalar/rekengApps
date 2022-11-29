import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/main_widget.dart';
import 'package:rekeng_apps/page/homepage/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset('assets/background/background.png',
              height: MediaQuery.of(context).size.height * 0.34,
              width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Pagi',
                          style: FontStyle.heading,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'NF',
                          style: FontStyle.heading2,
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: ColorApp.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.67)),
                      child: Image.asset(
                        'assets/icons/bell.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                MainWidget(),
                SizedBox(
                  height: 30,
                ),
                MenuWidget()
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Container mainWidget() {
  //   return
  // }
}
