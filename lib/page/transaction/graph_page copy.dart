import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_model.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class GraphPageOutcome extends StatelessWidget {
  const GraphPageOutcome({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    return FutureBuilder(
      future: model.getNeracaSaldo(userData.user.userID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var dataPemasukan = snapshot.data!.docs;
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.70,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // for (int i = 0; i <= index; i++) {
                  //   var kredit = (dataPemasukan[index].data()
                  //       as Map<String, dynamic>)["kredit"];
                  //   model.debet = model.kredit + kredit;
                  // }

                  return index.isEven
                      ? listPemasukanSecond(
                          tanggal: (dataPemasukan[index].data()
                              as Map<String, dynamic>)["tanggal"],
                          jumlah: (dataPemasukan[index].data()
                                  as Map<String, dynamic>)["kredit"]
                              .toString())
                      : listPemasukan(
                          tanggal: (dataPemasukan[index].data()
                              as Map<String, dynamic>)["tanggal"],
                          jumlah: (dataPemasukan[index].data()
                                  as Map<String, dynamic>)["kredit"]
                              .toString());
                },
              ),
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }

  Padding listPemasukanSecond({
    required String tanggal,
    required String jumlah,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 12),
      child: Container(
        height: 61,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorApp.primary.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengeluaran',
                    style: FontStyle.caption3,
                  ),
                  Text(
                    tanggal,
                    style: FontStyle.dayWeekunselected,
                  )
                ],
              ),
              Text(
                '+ Rp $jumlah',
                style: FontStyle.heading3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding listPemasukan({
    required String tanggal,
    required String jumlah,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 12),
      child: Container(
        height: 61,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: ColorApp.primary),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengeluaran',
                    style: FontStyle.caption2,
                  ),
                  Text(
                    tanggal,
                    style: FontStyle.dayWeekSelected,
                  )
                ],
              ),
              Text(
                '+ Rp $jumlah',
                style: FontStyle.heading4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
