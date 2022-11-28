import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/material/widget_reusable.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rekeng_apps/page/income/form_invoice.dart';

class Income extends StatelessWidget {
  Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
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
                          Image.asset(
                            'assets/icons/arrow_back.png',
                            color: ColorApp.white,
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
                      SizedBox(
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
                                  offset: Offset(0, 0),
                                )
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: FormInvoice()),
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
    );
  }
}
