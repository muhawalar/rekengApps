import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';

class WidgetCustom {
  // static DropdownBelow<String> dropdownBelow({
  //   required List<String> items,
  // }) {
  //   return DropdownBelow(
  //     value: items.first,
  //     icon: Icon(
  //       Icons.keyboard_arrow_down,
  //       color: Colors.black,
  //     ),
  //     itemWidth: 200,
  //     boxTextstyle: FontStyle.subtitle,
  //     boxHeight: 45,
  //     boxWidth: double.infinity,
  //     items: items.map<DropdownMenuItem<String>>((value) {
  //       return DropdownMenuItem<String>(
  //           alignment: AlignmentDirectional.centerStart,
  //           value: value,
  //           child: Padding(
  //             padding: const EdgeInsets.all(10.0),
  //             child: Text(
  //               value,
  //               style: FontStyle.dropdownValue,
  //             ),
  //           ));
  //     }).toList(),
  //     onChanged: (value) {},
  //   );
  // }

  static Row detailTransactionWidget({
    required String left,
    required String right,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: FontStyle.subtitle2,
        ),
        Text(
          right,
          style: FontStyle.subtitle,
        )
      ],
    );
  }
}
