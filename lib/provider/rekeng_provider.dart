import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';

class RekengProvider with ChangeNotifier {
  int currentIndex = 0;

  bool onTapDate = false;

  String selectedFilter = 'Pengeluaran';

  String selectedInvoice = 'Kas';

  DateTime inputDate = DateTime.now();

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

  void newOnTapDate() {
    onTapDate = !onTapDate;
    notifyListeners();
  }

  Future signIn(TextEditingController email, TextEditingController password,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Success')));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePageBottomBar();
        },
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  Future signUp(TextEditingController email, TextEditingController password,
      BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  void setSelectedFilterTransaction(String s) {
    selectedFilter = s;
    notifyListeners();
  }

  void setSelectedInvoice(String newValue) {
    selectedInvoice = newValue;
    notifyListeners();
  }

  void setInputTime(DateTime dateTime) {
    inputDate = dateTime;
    notifyListeners();
  }

  TextEditingController? name;
  TextEditingController? total;

  @override
  void dispose() {
    name!.dispose();
    total!.dispose();
    super.dispose();
  }

  // Future incomeOutcomeData() {
  //   final dataIncomeOutcome = FirebaseFirestore.instance.collection().doc();
  //   ic

  // }
}
