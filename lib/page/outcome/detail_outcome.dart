import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/material/widget_reusable.dart';

class DetailOutcome extends StatelessWidget {
  const DetailOutcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  SizedBox(
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
                          SizedBox(
                            height: 55,
                          ),
                          Column(
                            children: [
                              Text(
                                'Utang Usaha',
                                style: FontStyle.heading5,
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color:
                                        ColorApp.pengeluaran.withOpacity(0.2)),
                                child: Center(
                                  child: Text(
                                    'Pemasukan',
                                    style: FontStyle.countValueRed,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Rp 48.000',
                                style: FontStyle.value3,
                              ),
                            ],
                          ),
                          SizedBox(
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
                              SizedBox(
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
                                    style: FontStyle.countValue3,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              WidgetCustom.detailTransactionWidget(
                                  left: 'Nama', right: 'Setoran Modal'),
                              SizedBox(
                                height: 21,
                              ),
                              WidgetCustom.detailTransactionWidget(
                                  left: 'Waktu', right: '10.00 AM'),
                              SizedBox(
                                height: 21,
                              ),
                              WidgetCustom.detailTransactionWidget(
                                  left: 'Tanggal', right: 'Feb 22, 2022'),
                              SizedBox(
                                height: 21,
                              ),
                              Divider(
                                thickness: 1.5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              WidgetCustom.detailTransactionWidget(
                                  left: 'Jumlah', right: 'Rp 48.000'),
                              SizedBox(
                                height: 14,
                              ),
                              Divider(
                                thickness: 1.5,
                              ),
                              SizedBox(
                                height: 57,
                              ),
                              WidgetCustom.detailTransactionWidget(
                                  left: 'Total', right: 'Rp. 48.000'),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color:
                                            ColorApp.primary.withOpacity(0.4))),
                                child: Center(
                                  child: Text('Download Receipt',
                                      style: FontStyle.heading7),
                                ),
                              ),
                              SizedBox(
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
    );
  }
}
