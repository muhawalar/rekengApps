import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 203,
          color: ColorApp.primary,
        ),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pemasukan Tertinggi',
                style: FontStyle.heading3,
              ),
              Image.asset('assets/icons/updown.png')
            ],
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22),
          child: Container(
            height: 61,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorApp.primary),
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
                        'Penerimaan',
                        style: FontStyle.caption2,
                      ),
                      Text(
                        'Kemarin',
                        style: FontStyle.dayWeekSelected,
                      )
                    ],
                  ),
                  Text(
                    '+ Rp 1.000.000',
                    style: FontStyle.heading4,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22),
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
                          'Penerimaan',
                          style: FontStyle.caption3,
                        ),
                        Text(
                          'Jan 12, 2022',
                          style: FontStyle.dayWeekunselected,
                        )
                      ],
                    ),
                    Text(
                      '+ Rp 200.000',
                      style: FontStyle.heading3,
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
