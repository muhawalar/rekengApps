import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(children: [
          Image.asset('assets/background/background.png'),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: SizedBox(
                              height: 28,
                              width: 28,
                              child: Image.asset(
                                'assets/icons/arrow_back.png',
                                color: ColorApp.white,
                              ),
                            ),
                            onTap: () {
                              model.setControllerPage(0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
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
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.grey.shade400),
                      child: Icon(
                        Icons.person_rounded,
                        size: 100,
                        color: ColorApp.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      userData.user.username,
                      style: FontStyle.value3,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 35, right: 35),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    account(iconData: Icons.person, desc: 'Info Akun'),
                    const SizedBox(
                      height: 36,
                    ),
                    account(iconData: Icons.people, desc: 'Profile'),
                    const SizedBox(
                      height: 36,
                    ),
                    account(iconData: Icons.mail, desc: 'Pusat Pesan'),
                    const SizedBox(
                      height: 36,
                    ),
                    account(
                        iconData: Icons.security, desc: 'Login dan Keamanan'),
                    const SizedBox(
                      height: 36,
                    ),
                    account(iconData: Icons.lock, desc: 'Data dan Pribadi'),
                    const SizedBox(
                      height: 36,
                    ),
                  ])))
        ])
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
          const SizedBox(
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
