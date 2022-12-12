import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/transaction/graph_page%20copy.dart';
import 'package:rekeng_apps/page/transaction/graph_page.dart';
import 'package:rekeng_apps/page/transaction/neraca_saldo.dart';
import 'package:rekeng_apps/page/transaction/report_page.dart';
import 'package:rekeng_apps/page/transaction/workbook_page.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/transaction/workbook_page_buku_besar.dart';
import 'package:rekeng_apps/page/transaction/workbook_page_jurnal_penutup.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

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
        // appBar: AppBar(
        //   backgroundColor: ColorApp.white,
        //   elevation: 0,
        //   title: Text(
        //     'Transaksi',
        //     style: FontStyle.action,
        //   ),
        //   leading: InkWell(
        //       child: SizedBox(
        //           height: 28,
        //           width: 28,
        //           child: Image.asset('assets/icons/arrow_back.png')),
        //       onTap: () {
        //         model.setControllerPage(0);
        //       }),
        // ),
        body: ListView(children: [
      const SizedBox(
        height: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                child: SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset('assets/icons/arrow_back.png')),
                onTap: () {
                  model.setControllerPage(0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                }),
            Text(
              'Transaksi',
              style: FontStyle.heading3,
            ),
            Image.asset('assets/icons/download.png')
          ],
        ),
      ),
      const SizedBox(
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
      const SizedBox(
        height: 26,
      ),
      dropdown(context),
      const SizedBox(
        height: 29,
      ),
      model.selectedFilter == 'Pengeluaran'
          ? const GraphPageOutcome()
          : model.selectedFilter == 'Pemasukan'
              ? const GraphPageIncome()
              : model.selectedFilter == 'Jurnal Umum'
                  ? const WorkbookPage()
                  : model.selectedFilter == 'Buku Besar'
                      ? const WorkbookPageBukuBesar()
                      : model.selectedFilter == 'Neraca Saldo'
                          ? const NeracaPage()
                          : model.selectedFilter == 'Jurnal Penyesuaian'
                              ? const WorkbookPage()
                              : model.selectedFilter == 'Laporan Keuangan'
                                  ? const ReportPage()
                                  : const WorkbookPageJurnalPenutup()
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
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor:
                model!.onTapDate == false ? ColorApp.primary : ColorApp.white),
        child: Text(desc,
            style: model.onTapDate == false
                ? FontStyle.dayWeekSelected
                : FontStyle.dayWeekunselected));
  }

  Row dropdown(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Row(
      children: [
        const Expanded(
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
