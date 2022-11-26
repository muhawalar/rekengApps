import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                menu(image: 'assets/icons/jurnal.png', subtitle: 'Jurnal Umum'),
                menu(
                    image: 'assets/icons/bukuBesar.png',
                    subtitle: 'Buku Besar'),
                menu(
                    image: 'assets/icons/neraca.png', subtitle: 'Naraca Saldo'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                menu(
                    image: 'assets/icons/jurnalPenyesuaian.png',
                    subtitle: 'Jurnal \nPenyesuaian'),
                menu(
                    image: 'assets/icons/laporanKeuangan.png',
                    subtitle: 'Laporan \nKeuangan'),
                menu(
                    image: 'assets/icons/jurnalPenutup.png',
                    subtitle: 'Jurnal \nPenutup'),
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
