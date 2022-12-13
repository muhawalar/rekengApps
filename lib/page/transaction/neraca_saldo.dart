import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class NeracaPage extends StatelessWidget {
  NeracaPage({super.key});

  int total = 0;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userModel = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
        future: model.getNeracaSaldo(userModel.user.userID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var listNeracaSaldo = snapshot.data!.docs;
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                // scrollDirection: Axis.vertical,
                children: [
                  const headTable(),
                  SizedBox(
                    height: 500,
                    width: 650,
                    child: ListView.builder(
                      itemCount: listNeracaSaldo.length,
                      itemBuilder: (context, index) {
                        num kreditNeracaSaldo = (listNeracaSaldo[index].data()
                            as Map<String, dynamic>)["debet"];
                        num debetNeracaSaldo = (listNeracaSaldo[index].data()
                            as Map<String, dynamic>)["debet"];

                        total = total += debetNeracaSaldo as int;
                        print("DEBET SALDO : ${total}");
                        return contentTable(
                          index: index,
                        );
                      },
                    ),
                  )
                ],
              );
            }
          }
          // print(model.totalDebetNeracaSaldo);
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
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 40,
            width: 80,
            color: ColorApp.primary,
            child: Center(
                child: Text(
              'Kode Rek',
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
              'Rekening',
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
  contentTable({
    Key? key,
    this.index,
  }) : super(key: key);

  int? index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
      future: model.getNeracaSaldo(userProvider.user.userID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var neracaSaldo = snapshot.data!.docs;
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 80,
                      color: ColorApp.three,
                      child: Center(
                          child: Text(
                        (neracaSaldo[index!].data()
                            as Map<String, dynamic>)["kode_rek"],
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
                          child: Text(
                        (neracaSaldo[index!].data()
                            as Map<String, dynamic>)["rekening"],
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
                        "Rp. ${(neracaSaldo[index!].data() as Map<String, dynamic>)["debet"]}",
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
                        "Rp. ${(neracaSaldo[index!].data() as Map<String, dynamic>)["kredit"]}",
                        style: FontStyle.dayWeekunselected,
                      ))),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
