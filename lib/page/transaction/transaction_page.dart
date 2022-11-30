import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:rekeng_apps/material/widget_reusable.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/transaction/graph_page.dart';
import 'package:rekeng_apps/page/transaction/report_page.dart';
import 'package:rekeng_apps/page/transaction/workbook_page.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:provider/provider.dart';

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

  String firstValueTransaction = 'Pengeluaran';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Scaffold(
        body: ListView(children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                child: Container(
                    height: 28,
                    width: 28,
                    child: Image.asset('assets/icons/arrow_back.png')),
                onTap: () {
                  model.newScreenIndex(0);
                }),
            Text(
              'Transaksi',
              style: FontStyle.heading3,
            ),
            Image.asset('assets/icons/download.png')
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      // dropdown(context);
      // Padding(
      //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       buttonDate(model: model, desc: 'Hari'),
      //       buttonDate(model: model, desc: 'Minggu'),
      //       buttonDate(model: model, desc: 'Bulan'),
      //       buttonDate(model: model, desc: 'Tahun'),
      // ElevatedButton(

      //     onPressed: () {
      //       model.newOnTapDate();
      //     },
      //     child: Text('Minggu',
      //         style: model.onTapDate == false
      //             ? FontStyle.dayWeekSelected
      //             : FontStyle.dayWeekunselected),
      //     style: ElevatedButton.styleFrom(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10)),
      //         backgroundColor: model.onTapDate == false
      //             ? ColorApp.primary
      //             : ColorApp.white)),
      // ElevatedButton(onPressed: () {}, child: Text('Minggu')),
      // ElevatedButton(onPressed: () {}, child: Text('Bulan')),
      // ElevatedButton(onPressed: () {}, child: Text('Tahun')),
      // model.onTapDate == false
      //     ? InkWell(
      //         child: buttonTransactionNot(text: 'Hari'),
      //         onTap: () {
      //           model.newOnTapDate(true);
      //         },
      //       )
      //     : buttonTransaction(text: 'Hari'),
      // model.onTapDate == true
      //     ? InkWell(
      //         child: buttonTransactionNot(text: 'Minggu'),
      //         onTap: () {
      //           model.newOnTapDate(true);
      //         },
      //       )
      //     : buttonTransaction(text: 'Minggu'),
      // model.onTapDate == true
      //     ? InkWell(
      //         child: buttonTransactionNot(text: 'Bulan'),
      //         onTap: () {
      //           model.newOnTapDate(true);
      //         },
      //       )
      //     : buttonTransaction(text: 'Bulan'),
      // model.onTapDate == true
      //     ? InkWell(
      //         child: buttonTransactionNot(text: 'Tahun'),
      //         onTap: () {
      //           model.newOnTapDate(true);
      //         },
      //       )
      //     : buttonTransaction(text: 'Tahun'),
      //     ],
      //   ),
      // ),
      SizedBox(
        height: 26,
      ),
      dropdown(context),
      SizedBox(
        height: 29,
      ),
      model.selectedFilter == 'Pengeluaran'
          ? GraphPage()
          : model.selectedFilter == 'Pemasukan'
              ? GraphPage()
              : model.selectedFilter == 'Jurnal Umum'
                  ? WorkbookPage()
                  : model.selectedFilter == 'Buku Besar'
                      ? WorkbookPage()
                      : model.selectedFilter == 'Neraca Saldo'
                          ? WorkbookPage()
                          : model.selectedFilter == 'Jurnal Penyesuaian'
                              ? WorkbookPage()
                              : model.selectedFilter == 'Laporan Keuangan'
                                  ? ReportPage()
                                  : WorkbookPage()
    ]));
  }

  ElevatedButton buttonDate({
    required RekengProvider? model,
    required String desc,
  }) {
    return ElevatedButton(
        onPressed: () {
          model.newOnTapDate();
        },
        child: Text(desc,
            style: model!.onTapDate == false
                ? FontStyle.dayWeekSelected
                : FontStyle.dayWeekunselected),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor:
                model.onTapDate == false ? ColorApp.primary : ColorApp.white));
  }

  Row dropdown(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Row(
      children: [
        Expanded(
          flex: 2,
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
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      value: model.selectedFilter,
                      items: transactionFilterItems
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: ColorApp.font),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        model.setSelectedFilterTransaction(newValue!);
                        //  = newValue;
                      },
                    )

                    // WidgetCustom.dropdownBelow(items: transactionFilterItems),
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
          borderRadius: BorderRadius.circular(10), color: ColorApp.white),
      child: Center(
        child: Text(
          text,
          style: FontStyle.dayWeekunselected,
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container buttonTransactionNot({
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
