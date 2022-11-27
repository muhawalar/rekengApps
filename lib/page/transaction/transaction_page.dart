import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:rekeng_apps/page/transaction/graph_page.dart';
import 'package:rekeng_apps/page/transaction/workbook_page.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  List<String> transactionFilterItems = [
    'Pengeluaran',
    'Pemasukan',
    'Jurnal Umum',
    'Buku Besar',
    'Neraca Saldo',
    'Jurnal Penyesuaian',
    'Laporan Keuangan',
    'Jurnal Penutup',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/arrow_back.png'),
          Text(
            'Transaksi',
            style: FontStyle.heading3,
          ),
          Image.asset('assets/icons/download.png')
        ],
      ),
      SizedBox(
        height: 43,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonTransaction(text: 'Hari'),
            Text(
              'Minggu',
              style: FontStyle.dayWeekunselected,
            ),
            Text(
              'Bulan',
              style: FontStyle.dayWeekunselected,
            ),
            Text(
              'Tahun',
              style: FontStyle.dayWeekunselected,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 26,
      ),
      dropdown(),
      SizedBox(
        height: 29,
      ),
      WorkbookPage()
    ]));
  }

  Row dropdown() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorApp.font, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownBelow(
                    value: transactionFilterItems.first,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    itemWidth: 200,
                    boxTextstyle: FontStyle.subtitle,
                    boxHeight: 45,
                    boxWidth: 200,
                    items: transactionFilterItems
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                          alignment: AlignmentDirectional.centerStart,
                          value: value,
                          child: Text(
                            value,
                            style: FontStyle.dropdownValue,
                          ));
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Container buttonTransaction({
    required String text,
  }) {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: ColorApp.primary),
      child: Center(
        child: Text(
          text,
          style: FontStyle.dayWeekSelected,
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
