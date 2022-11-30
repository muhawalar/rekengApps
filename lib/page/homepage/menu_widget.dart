import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaksi',
          style: FontStyle.heading3,
        ),
        SizedBox(
          height: 19,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: menu(
                      image: 'assets/icons/jurnal.png',
                      subtitle: 'Jurnal Umum'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Jurnal Umum');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
                InkWell(
                  child: menu(
                      image: 'assets/icons/bukuBesar.png',
                      subtitle: 'Buku Besar'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Buku Besar');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
                InkWell(
                  child: menu(
                      image: 'assets/icons/neraca.png',
                      subtitle: 'Naraca Saldo'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Neraca Saldo');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: menu(
                      image: 'assets/icons/jurnalPenyesuaian.png',
                      subtitle: 'Jurnal \nPenyesuaian'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model
                            .setSelectedFilterTransaction('Jurnal Penyesuaian');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
                InkWell(
                  child: menu(
                      image: 'assets/icons/laporanKeuangan.png',
                      subtitle: 'Laporan \nKeuangan'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Laporan Keuangan');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
                InkWell(
                  child: menu(
                      image: 'assets/icons/jurnalPenutup.png',
                      subtitle: 'Jurnal \nPenutup'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Jurnal Penutup');
                        model.newScreenIndex(1);
                        return HomePageBottomBar();
                      },
                    ));
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Container menu({required String image, required String subtitle}) {
    return Container(
      width: 120,
      // height: 94,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorApp.primary.withOpacity(0.1)),
            child: Image.asset(image),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            subtitle,
            style: FontStyle.subtitle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
