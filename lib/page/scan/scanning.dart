import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/income/income.dart';
import 'package:rekeng_apps/page/outcome/outcome.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/background/background.png'),
          const SizedBox(
            height: 149,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorApp.primary.withOpacity(0.2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: ColorApp.primary,
                        size: 50,
                      ),
                      Text(
                        'Pemasukan',
                        style: FontStyle.countValue2,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Income();
                    },
                  ));
                },
              ),
              InkWell(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorApp.primary.withOpacity(0.2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: ColorApp.pengeluaran,
                        size: 50,
                      ),
                      Text(
                        'Pengeluaran',
                        style: FontStyle.countValue3,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Outcome();
                    },
                  ));
                },
              )
            ],
          )
        ],
      ),
    ));
  }
}
