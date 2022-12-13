import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final UserProvider user = Provider.of<UserProvider>(context);
    Future<int> totalPemasukan = model.getTotalPemasukan(user.user.userID);
    Future<int> totalPengeluaran = model.getTotalPengeluaran(user.user.userID);
    print("TOTAL PEMASUKAN : ${totalPemasukan}");

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.primary,
          boxShadow: [
            BoxShadow(color: ColorApp.font.withOpacity(0.2), blurRadius: 3)
          ]),
      height: 201.99,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Keseimbangan',
                  style: FontStyle.caption,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Rp. ${model.pemasukan - model.pengeluaran}',
                  style: FontStyle.value,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorApp.white.withOpacity(0.1),
                              child: Icon(
                                Icons.arrow_downward_outlined,
                                color: ColorApp.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Pemasukan',
                              style: FontStyle.action,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        FutureBuilder(
                            future: totalPemasukan,
                            builder: (context, snapshot) {
                              model.pemasukan = snapshot.data!;
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Text(
                                  'Rp. ' + snapshot.data.toString(),
                                  style: FontStyle.value2,
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorApp.white.withOpacity(0.1),
                              child: Icon(
                                Icons.arrow_upward_outlined,
                                color: ColorApp.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Pengeluaran',
                              style: FontStyle.action,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        FutureBuilder(
                          future: totalPengeluaran,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                model.pengeluaran = snapshot.data!;
                                return Text(
                                  'Rp. ' + snapshot.data.toString(),
                                  style: FontStyle.value2,
                                );
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                  color: ColorApp.white),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
