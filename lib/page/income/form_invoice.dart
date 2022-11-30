import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/material/widget_reusable.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class FormInvoice extends StatelessWidget {
  FormInvoice({super.key});
  List<String> choiceListItems = ['Kas', 'Utang Usaha'];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilihan',
          style: FontStyle.dropdownValue,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorApp.black.withOpacity(0.4))),
            height: 50,
            child: DropdownButton(
              isExpanded: true,
              underline: Container(),
              value: model.selectedInvoice,
              items: choiceListItems.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: ColorApp.font),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                model.setSelectedInvoice(newValue!);
                model.selectedInvoice = newValue;
              },
            )),
        SizedBox(
          height: 17,
        ),
        Text(
          'Nama',
          style: FontStyle.dropdownValue,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          child: TextFormField(
            controller: model.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorApp.black.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          'Jumlah',
          style: FontStyle.dropdownValue,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          child: TextFormField(
            controller: model.total,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefix: Text(
                'Rp. ',
                style: FontStyle.countValue,
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorApp.black.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          'Tanggal',
          style: FontStyle.dropdownValue,
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorApp.black.withOpacity(0.4))),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${model.inputDate.day}/${model.inputDate.month}/${model.inputDate.year}',
                    style: FontStyle.dropdownValue,
                  ),
                  Icon(
                    Icons.date_range,
                    color: ColorApp.grey,
                  )
                ],
              ),
            ),
          ),
          onTap: () async {
            DateTime? newInputDate = await showDatePicker(
                context: context,
                initialDate: model.inputDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2030));
            if (newInputDate == null) return;
            model.setInputTime(newInputDate);
          },
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          'Invoice',
          style: FontStyle.dropdownValue,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            width: double.infinity,
            child: DottedBorder(
                radius: Radius.circular(8),
                color: ColorApp.black.withOpacity(0.4),
                strokeWidth: 1,
                dashPattern: [10, 6],
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: ColorApp.black.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Add Invoice'),
                    ],
                  ),
                ))),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 52,
              width: 145,
              decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Kirim',
                    style: FontStyle.heading,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: ColorApp.white,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
