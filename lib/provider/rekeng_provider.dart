import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';
import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
import 'package:rekeng_apps/provider/rekeng_model.dart';

class RekengProvider with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  num debetNeracaSaldo = 0;
  num kreditNeracaSaldo = 0;
  num kreditBukuBesar = 0;
  num debetBukuBesar = 0;

  int pengeluaran = 184000;
  int pemasukan = 2840000;

  int totalKeseimbangan() {
    return pemasukan - pengeluaran;
  }

  void totalPengeluaran(int total) {
    total += pengeluaran;
    print(pengeluaran);
    notifyListeners();
  }

  void totalPemasukan(int total) {
    total += pemasukan;
    print(pemasukan);
    notifyListeners();
  }

  void totalDebet() {}

  num totalKredit() {
    return kreditBukuBesar + kreditNeracaSaldo;
  }

  void countDebetNeracaSaldo(num value) {
    debetNeracaSaldo += value;
    print(debetNeracaSaldo);
    notifyListeners();
  }

  void countKreditNeracaSaldo(num value) {
    kreditNeracaSaldo += value;
    notifyListeners();
  }

  void countKreditBukuBesar(num value) {
    kreditBukuBesar += value;
    notifyListeners();
  }

  void countDebetBukuBesar(num value) {
    debetBukuBesar += value;
    notifyListeners();
  }

  int currentIndex = 0;

  bool onTapDate = false;

  String selectedFilter = 'Pengeluaran';

  String selectedInvoice = 'Kas';

  DateTime inputDate = DateTime.now();

  List<dynamic> screens = [
    const HomePage(),
    TransactionPage(),
    const ScanningPage(),
    const ProfilePage(),
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Success')));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomePageBottomBar();
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
          return const LoginPage();
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

  final name = TextEditingController();
  final inputPengeluaran = TextEditingController();
  final inputPemasukan = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    inputPengeluaran.dispose();
    inputPemasukan.dispose();
    super.dispose();
  }

  Future<QuerySnapshot<Object?>> getNeracaSaldo() async {
    CollectionReference neracaSaldo = firestore.collection("neraca_saldo");
    return neracaSaldo.get();
  }

  Future<QuerySnapshot<Object?>> getJurnalUmum() async {
    CollectionReference jurnalUmum = firestore.collection("jurnal_umum");
    return jurnalUmum.get();
  }

  Future<QuerySnapshot<Object?>> getBukuBesar() async {
    CollectionReference bukuBesar = firestore.collection("buku_besar");
    return bukuBesar.get();
  }

  Future<QuerySnapshot<Object?>> getJurnalPenutup() async {
    CollectionReference jurnalPenutup = firestore.collection("jurnal_penutup");
    return jurnalPenutup.get();
  }

  Future addPemasukanNeracaSaldo(
      Pemasukan pemasukan, PemasukanJurnalUmum pemasukanJurnalUmum) async {
    final pemasukandata =
        FirebaseFirestore.instance.collection('neraca_saldo').doc();

    final pemasukanJU =
        FirebaseFirestore.instance.collection('jurnal_umum').doc();

    final pemasukanJP =
        FirebaseFirestore.instance.collection('jurnal_penutup').doc();

    final pemasukanBB =
        FirebaseFirestore.instance.collection('buku_besar').doc();

    final json = pemasukan.toJson();
    final json1 = pemasukanJurnalUmum.toJson();
    try {
      await pemasukandata.set(json);
      await pemasukanJU.set(json1);
      await pemasukanJP.set(json1);
      await pemasukanBB.set(json1);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future addPengeluaranNeracaSaldo(Pengeluaran pengeluaran,
      PengeluaranJurnalUmum pengeluaranJurnalUmum) async {
    final pengeluarandata =
        FirebaseFirestore.instance.collection('neraca_saldo').doc();

    final pengeluaranJU =
        FirebaseFirestore.instance.collection('jurnal_umum').doc();

    final pengeluaranJP =
        FirebaseFirestore.instance.collection('jurnal_penutup').doc();

    final pengeluaranBB =
        FirebaseFirestore.instance.collection('buku_besar').doc();

    final json = pengeluaran.toJson();
    final json1 = pengeluaranJurnalUmum.toJson();

    try {
      await pengeluarandata.set(json);
      await pengeluaranJU.set(json1);
      await pengeluaranJP.set(json1);
      await pengeluaranBB.set(json1);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void getAllKredit() {
    getNeracaSaldo();
  }
}
