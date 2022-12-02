import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Container(
          height: 564,
          width: 610,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: ColorApp.primary.withOpacity(0.35)),
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
              children: [
                reportWidget(desc: 'Aset Lancar', value: '5.000.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidget(desc: 'Kas', value: '9.000.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidget(desc: 'Giro', value: '500.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidget(desc: 'Deposito', value: '700.000'),
                const SizedBox(
                  height: 10,
                ),
                reportUnderlineWidget(desc: 'Piutang Usaha', value: '900.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidgetBold(
                    desc: 'Jumlah Aset Lancar', value: '16.500.000'),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Aset Tetap',
                      style: FontStyle.subtitle3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                reportWidgetNew(desc: 'Tanah', value: '220.000.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidget(desc: 'Bangunan', value: '80.000.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidgetDouble(
                    desc: 'Bangunan',
                    value: '5.000.000',
                    value2: '120.000.000'),
                const SizedBox(
                  height: 29,
                ),
                reportWidget(desc: 'Peralatan', value: '500.000'),
                const SizedBox(
                  height: 10,
                ),
                reportUnderlineDouble(
                    desc: 'Akumulasi Penyusutan Peralatan',
                    value: '50.000',
                    value2: '450.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidgetBold(
                    desc: 'Jumlah Aset Tetap', value: '356.950.000'),
                const SizedBox(
                  height: 10,
                ),
                reportWidgetBold(
                    desc: 'Jumlah Aset Lancar', value: '356.950.000'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row reportWidget({
    required desc,
    required value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 159,
          child: Text(
            desc,
            style: FontStyle.subtitle3,
          ),
        ),
        const SizedBox(
          width: 117,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle3,
        )
      ],
    );
  }

  Row reportWidgetNew({
    required desc,
    required value,
    // required value2,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 159,
          child: Text(
            desc,
            style: FontStyle.subtitle3,
          ),
        ),
        const SizedBox(
          width: 243,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle3,
        ),
      ],
    );
  }

  Row reportWidgetDouble({required desc, required value, required value2}) {
    return Row(
      children: [
        SizedBox(
          width: 159,
          child: Text(
            desc,
            style: FontStyle.subtitle3,
          ),
        ),
        const SizedBox(
          width: 117,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle3,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Rp.' + value2,
          style: FontStyle.subtitle3,
        )
      ],
    );
  }

  Row reportWidgetBold({
    required desc,
    required value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 159,
          child: Text(
            desc,
            style: FontStyle.subtitle5,
          ),
        ),
        const SizedBox(
          width: 243,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle5,
        )
      ],
    );
  }

  Row reportUnderlineWidget({
    required desc,
    required value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 159,
          child: Text(
            desc,
            style: FontStyle.subtitle3,
          ),
        ),
        const SizedBox(
          width: 117,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle4,
        )
      ],
    );
  }

  Row reportUnderlineDouble({
    required desc,
    required value,
    required value2,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 220,
          child: Text(
            desc,
            style: FontStyle.subtitle3,
          ),
        ),
        const SizedBox(
          width: 55,
        ),
        Text(
          'Rp. ' + value,
          style: FontStyle.subtitle4,
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          'Rp. ' + value2,
          style: FontStyle.subtitle4,
        )
      ],
    );
  }
}
