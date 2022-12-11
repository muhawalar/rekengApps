import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class ScanML extends StatelessWidget {
  const ScanML({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final pattern = RegExp(r'RP\s*\d{1,3}(\.\d{3})*(,\d{2})?');
    final matches = pattern.allMatches(model.scannedText);
    String? value;

    for (final match in matches) {
      value = match.group(0);
    }
    print(value);

    return Scaffold(
      body: Column(
        children: [
          InkWell(
            child: Container(child: Image.file(File(model.imageFile!.path))),
            onTap: () {
              model.getRecognizedText(model.imageFile!);
              model.getKreditFromFirebase();
            },
          ),

          Text(value.toString())

          // Expanded(
          //     child: ListView.builder(
          //   itemCount: result.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 100,
          //       color: ColorApp.four,
          //       child: Text(result[index]),
          //     );
          //   },
          // ))
        ],
      ),
    );
  }
}
