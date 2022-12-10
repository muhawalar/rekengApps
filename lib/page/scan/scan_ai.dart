import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class ScanML extends StatelessWidget {
  ScanML({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    // print(model.scannedText);
    // var splitRp = model.scannedText.split(':').last;
    // var getRp = splitRp.split('a').first;
    // String text = '';
    // String text = model.scannedText.split(":")[15];

    // for (int i = 0; i < model.elementText.length; i++) {
    //   if (model.elementText.) {
    //     text = model.elementText[i];
    //   }
    // }

    // int intText = int.parse(text);

    // model.scannedText =
    //     model.scannedText.replaceAll(new RegExp('^[a-z]:', dotAll: true), ' ');
    // int scannedTextIntegerOnly = int.parse(
    //   model.scannedText,
    //   // radix: 32,
    // );
    // assert(scannedTextIntegerOnly is int);
    // print(scannedTextIntegerOnly);
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            child: Container(
                child: Column(
              children: [
                Image.file(File(model.imageFile!.path)),
                Text(model.scannedText.toString())
                // Text(model.scannedText.startsWith("RP").toString())
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: model.scannedText.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Text(model.scannedText.toString());
                //     },
                //   ),
                // )
              ],
            )),
            onTap: () {
              model.getRecognizedText(model.imageFile!);
            },
          ),
        ],
      ),
    );
  }
}
