import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';

class RekengProvider with ChangeNotifier {
  int currentIndex = 0;

  List<dynamic> screens = [
    HomePage(),
    TransactionPage(),
    ScanningPage(),
    ProfilePage(),
  ];

  void newScreenIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
