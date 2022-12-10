import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rekeng_apps/comingsoon.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
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
        const SizedBox(
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
                        model.setControllerPage(1);
                        return TransactionPage();
                        // return const HomePageBottomBar();
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
                        model.setControllerPage(1);
                        return TransactionPage();
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
                        model.setControllerPage(1);
                        return TransactionPage();
                      },
                    ));
                  },
                ),
              ],
            ),
            const SizedBox(
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
                        model.setControllerPage(1);
                        return TransactionPage();
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
                        model.setControllerPage(1);
                        return TransactionPage();
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
                        model.setControllerPage(1);
                        return TransactionPage();
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
                      image: 'assets/icons/handshake.png', subtitle: 'Akad'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model
                            .setSelectedFilterTransaction('Jurnal Penyesuaian');
                        model.setControllerPage(1);
                        return TransactionPage();
                      },
                    ));
                  },
                ),
                InkWell(
                  child:
                      menu(image: 'assets/icons/giving.png', subtitle: 'Infaq'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        model.setSelectedFilterTransaction('Laporan Keuangan');
                        model.setControllerPage(1);
                        return TransactionPage();
                      },
                    ));
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40,
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
          const SizedBox(
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
