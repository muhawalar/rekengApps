import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
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
                  'Rp. ' + model.totalKeseimbangan().toString(),
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
                        Text(
                          'Rp. ' + model.pemasukan.toString(),
                          style: FontStyle.value2,
                        ),
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
                        Text(
                          'Rp. ' + model.pengeluaran.toString(),
                          style: FontStyle.value2,
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
