import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class WorkbookPage extends StatelessWidget {
  const WorkbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          // scrollDirection: Axis.vertical,
          children: [
            headTable(),
            Container(
              height: 500,
              width: 650,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return contentTable();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class headTable extends StatelessWidget {
  const headTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 40,
            width: 80,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Tanggal',
              style: FontStyle.dayWeekSelected,
            ))),
        VerticalDivider(
          width: 1,
        ),
        Container(
            height: 40,
            width: 200,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Keterangan',
              style: FontStyle.dayWeekSelected,
            ))),
        VerticalDivider(
          width: 1,
        ),
        Container(
            height: 40,
            width: 60,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Ref',
              style: FontStyle.dayWeekSelected,
            ))),
        VerticalDivider(
          width: 1,
        ),
        Container(
            height: 40,
            width: 150,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Debet',
              style: FontStyle.dayWeekSelected,
            ))),
        VerticalDivider(
          width: 1,
        ),
        Container(
            height: 40,
            width: 150,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Kredit',
              style: FontStyle.dayWeekSelected,
            ))),
      ],
    );
  }
}

class contentTable extends StatelessWidget {
  const contentTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
              height: 100,
              width: 80,
              color: ColorApp.three,
              child: Center(
                  child: Text(
                'Tanggal',
                style: FontStyle.dayWeekunselected,
              ))),
          VerticalDivider(
            width: 1,
          ),
          Container(
              height: 100,
              width: 200,
              color: ColorApp.three,
              child: Center(
                  child: Text(
                'Keterangan',
                style: FontStyle.dayWeekunselected,
              ))),
          VerticalDivider(
            width: 1,
          ),
          Container(
              height: 100,
              width: 60,
              color: ColorApp.three,
              child: Center(
                  child: Text(
                'Ref',
                style: FontStyle.dayWeekunselected,
              ))),
          VerticalDivider(
            width: 1,
          ),
          Container(
              height: 100,
              width: 150,
              color: ColorApp.three,
              child: Center(
                  child: Text(
                'Debet',
                style: FontStyle.dayWeekunselected,
              ))),
          VerticalDivider(
            width: 1,
          ),
          Container(
              height: 100,
              width: 150,
              color: ColorApp.three,
              child: Center(
                  child: Text(
                'Kredit',
                style: FontStyle.dayWeekunselected,
              ))),
        ],
      ),
    );
  }
}
