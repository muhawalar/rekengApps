import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_model.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class WorkbookPageBukuBesar extends StatelessWidget {
  const WorkbookPageBukuBesar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
        future: model.getBukuBesar(userData.user.userID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var bukuBesar = snapshot.data!.docs;
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  // scrollDirection: Axis.vertical,
                  children: [
                    const headTable(),
                    SizedBox(
                      height: 500,
                      width: 650,
                      child: ListView.builder(
                        itemCount: bukuBesar.length,
                        itemBuilder: (context, index) {
                          num kreditBukuBesar = (bukuBesar[index].data()
                              as Map<String, dynamic>)["kredit"];
                          num debitBukuBesar = (bukuBesar[index].data()
                              as Map<String, dynamic>)["debet"];
                          // model.countKreditBukuBesar(kreditBukuBesar);
                          // model.countDebetBukuBesar(kreditBukuBesar);
                          return contentTable(
                            index: index,
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
          }
          return Container();
        },
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
        const VerticalDivider(
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
        const VerticalDivider(
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
        const VerticalDivider(
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
        const VerticalDivider(
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
  contentTable({Key? key, required this.index}) : super(key: key);
  int? index;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    return FutureBuilder(
      future: model.getBukuBesar(userData.user.userID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var bukuBesar = snapshot.data!.docs;
          if (snapshot.connectionState == ConnectionState.done) {
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
                        (bukuBesar[index!].data()
                            as Map<String, dynamic>)["tanggal"],
                        style: FontStyle.dayWeekunselected,
                      ))),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Container(
                      height: 100,
                      width: 200,
                      color: ColorApp.three,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (bukuBesar[index!].data()
                              as Map<String, dynamic>)["keterangan"],
                          style: FontStyle.dayWeekunselected,
                        ),
                      ))),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Container(
                      height: 100,
                      width: 60,
                      color: ColorApp.three,
                      child: Center(
                          child: Text(
                        (bukuBesar[index!].data()
                            as Map<String, dynamic>)["ref"],
                        style: FontStyle.dayWeekunselected,
                      ))),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Container(
                      height: 100,
                      width: 150,
                      color: ColorApp.three,
                      child: Center(
                          child: Text(
                        "Rp. ${(bukuBesar[index!].data() as Map<String, dynamic>)["debet"]}",
                        style: FontStyle.dayWeekunselected,
                      ))),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Container(
                      height: 100,
                      width: 150,
                      color: ColorApp.three,
                      child: Center(
                          child: Text(
                        "Rp. ${(bukuBesar[index!].data() as Map<String, dynamic>)["kredit"]}",
                        style: FontStyle.dayWeekunselected,
                      ))),
                ],
              ),
            );
          }
          return Container();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
