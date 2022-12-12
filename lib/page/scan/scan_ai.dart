import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/material/themes_font.dart';
import 'package:rekeng_apps/page/income/income.dart';
import 'package:rekeng_apps/page/scan/income_scan.dart';
import 'package:rekeng_apps/page/scan/result_scan_ai.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/scan/scanning_ai_page.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class ScanML extends StatelessWidget {
  const ScanML({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    final pattern = RegExp(r'RP\s*\d{1,3}(\.\d{3})*(,\d{2})?');
    final secondPattern = RegExp(r'\d{1,3}(\.\d{3})*(,\d{2})?');
    final matches = pattern.allMatches(model.scannedText);
    final secondMatches = secondPattern.allMatches(model.scannedText);
    String? value;
    String? secondValue;

    for (final match in matches) {
      value = match.group(0);
    }

    for (final match in secondMatches) {
      secondValue = match.group(0);
    }
    print(value);
    print(secondValue);
    // print("kredit${model.finalKredit}");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.white,
        leading: InkWell(
          child: Image.asset(
            'assets/icons/arrow_back.png',
            color: ColorApp.font,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Scan Struk',
          style: FontStyle.heading3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(
                    model.imageFile!.path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            value != null
                ? Text('Result :', style: FontStyle.heading6)
                : Container(),
            SizedBox(
              height: 20,
            ),
            value == null
                ? Text('')
                : Container(
                    height: 64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        value.toString(),
                        style: FontStyle.heading5,
                      ),
                    )),
            SizedBox(
              height: 20,
            ),
            value == null
                ? InkWell(
                    child: Container(
                      height: 64,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: ColorApp.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            color: ColorApp.white,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Scan',
                            style: FontStyle.heading2,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      model.getRecognizedText(model.imageFile!);
                    },
                  )
                : InkWell(
                    child: Container(
                      height: 64,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: ColorApp.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lanjutkan',
                            style: FontStyle.heading2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorApp.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      model.resultScan = secondValue;
                      print("resultscan = ${model.resultScan}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScanningPageML()));
                    },
                  )

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
      ),
    );
  }
}
