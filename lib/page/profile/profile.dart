import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SingleChildScrollView(
          child: Stack(children: [
            Image.asset('assets/background/background.png'),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/icons/arrow_back.png',
                            color: ColorApp.white,
                          ),
                          Text(
                            'Profile',
                            style: FontStyle.heading4,
                          ),
                          Icon(
                            Icons.notifications_none_rounded,
                            color: ColorApp.white,
                            size: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      CircleAvatar(
                        radius: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Muh Awal',
                        style: FontStyle.value3,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      account(iconData: Icons.person, desc: 'Info Akun'),
                      SizedBox(
                        height: 36,
                      ),
                      account(iconData: Icons.people, desc: 'Profile'),
                      SizedBox(
                        height: 36,
                      ),
                      account(iconData: Icons.mail, desc: 'Pusat Pesan'),
                      SizedBox(
                        height: 36,
                      ),
                      account(
                          iconData: Icons.security, desc: 'Login dan Keamanan'),
                      SizedBox(
                        height: 36,
                      ),
                      account(iconData: Icons.lock, desc: 'Data dan Pribadi'),
                      SizedBox(
                        height: 36,
                      ),
                    ])))
          ]),
        )
      ]),
    ));
  }

  Padding account({required IconData iconData, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: ColorApp.grey,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            desc,
            style: FontStyle.subtitle,
          )
        ],
      ),
    );
  }
}
