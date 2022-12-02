import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/outcome/form_outcome.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class Outcome extends StatelessWidget {
  const Outcome({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/background/background.png'),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                model.newScreenIndex(2);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const HomePageBottomBar();
                                  },
                                ));
                              },
                            ),
                            Text(
                              'Tambah Pengeluaran',
                              style: FontStyle.heading4,
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: ColorApp.white,
                              size: 30,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 59,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Container(
                            height: 595,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorApp.white,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 20,
                                    color: ColorApp.black,
                                    offset: const Offset(0, 0),
                                  )
                                ]),
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: FormOutcome()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
