import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/main_widget.dart';
import 'package:rekeng_apps/page/homepage/menu_widget.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: FutureBuilder(
          future: model.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var userData = snapshot.data!.docs;
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Stack(children: [
                    Image.asset('assets/background/background.png',
                        height: MediaQuery.of(context).size.height * 0.34,
                        width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 80, left: 15.0, right: 15.0),
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
                                    'Selamat Datang',
                                    style: FontStyle.heading,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    userProvider.user.username,
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
                          const SizedBox(
                            height: 33,
                          ),
                          const MainWidget(),
                          const SizedBox(
                            height: 30,
                          ),
                          const MenuWidget()
                        ],
                      ),
                    ),
                  ]),
                );
              }
              return Container();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  // Container mainWidget() {
  //   return
  // }
}
