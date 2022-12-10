import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/material/widget_reusable.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';

class DetailIncome extends StatelessWidget {
  DetailIncome(
      {required this.pilihan,
      required this.nama,
      required this.waktu,
      required this.jumlah,
      required this.tanggal,
      super.key});

  String pilihan;
  String nama;
  String waktu;
  String tanggal;
  String jumlah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/background/background.png'),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            child: Image.asset(
                              'assets/icons/arrow_back.png',
                              color: ColorApp.white,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomePageBottomBar();
                                },
                              ));
                            }),
                        Text(
                          'Transaksi Detail',
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorApp.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 55,
                            ),
                            Column(
                              children: [
                                Text(
                                  pilihan,
                                  style: FontStyle.heading5,
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: ColorApp.primary.withOpacity(0.2)),
                                  child: Center(
                                    child: Text(
                                      'Pemasukan',
                                      style: FontStyle.countValue,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  jumlah,
                                  style: FontStyle.value3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Transaksi Detail',
                                  style: FontStyle.heading6,
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: FontStyle.subtitle2,
                                    ),
                                    Text(
                                      'Pemasukan',
                                      style: FontStyle.countValue2,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                WidgetCustom.detailTransactionWidget(
                                    left: 'Nama', right: 'Setoran Modal'),
                                const SizedBox(
                                  height: 21,
                                ),
                                WidgetCustom.detailTransactionWidget(
                                    left: 'Waktu', right: '10.00 AM'),
                                const SizedBox(
                                  height: 21,
                                ),
                                WidgetCustom.detailTransactionWidget(
                                    left: 'Tanggal', right: 'Feb 22, 2022'),
                                const SizedBox(
                                  height: 21,
                                ),
                                const Divider(
                                  thickness: 1.5,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WidgetCustom.detailTransactionWidget(
                                    left: 'Jumlah', right: 'Rp 48.000'),
                                const SizedBox(
                                  height: 14,
                                ),
                                const Divider(
                                  thickness: 1.5,
                                ),
                                const SizedBox(
                                  height: 57,
                                ),
                                WidgetCustom.detailTransactionWidget(
                                    left: 'Total', right: 'Rp. 48.000'),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: ColorApp.primary
                                              .withOpacity(0.4))),
                                  child: Center(
                                    child: Text('Download Receipt',
                                        style: FontStyle.heading7),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
