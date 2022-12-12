import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rekeng_apps/page/homepage/home_page.dart';
import 'package:rekeng_apps/page/homepage/home_page_navbar.dart';

import 'package:rekeng_apps/page/loginregister/login.dart';
import 'package:rekeng_apps/page/profile/profile.dart';
import 'package:rekeng_apps/page/scan/scan_ai.dart';
import 'package:rekeng_apps/page/scan/scanning.dart';
import 'package:rekeng_apps/page/transaction/transaction_page.dart';
import 'package:rekeng_apps/provider/rekeng_model.dart';

import 'package:image_picker/image_picker.dart';

class RekengProvider with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isUser = false;

  num debetNeracaSaldo = 0;
  num kreditNeracaSaldo = 0;
  num kreditBukuBesar = 0;
  num debetBukuBesar = 0;

  int pengeluaran = 184000;
  int pemasukan = 2840000;

  String? resultScan;

  // PersistentTabController? controller;
  var controller = PersistentTabController(initialIndex: 0);

  void setControllerPage(int newIndex) {
    controller = PersistentTabController(initialIndex: newIndex);
    notifyListeners();
  }

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

  List<Widget> screens = [
    const HomePage(),
    TransactionPage(),
    ScanML(),
    ScanningPage(),
    ProfilePage()
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
          isUser = true;
          print(isUser);
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

  var dataUser = {};
  Future userData(UserData newUserData, BuildContext context) async {
    final userData = FirebaseFirestore.instance.collection('user_data').doc();
    newUserData.userID = userData.id;

    final json = newUserData.toJson();
    try {
      await userData.set(json);
      print(userData.id);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    notifyListeners();
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

  Future<QuerySnapshot<Object?>> getNeracaSaldo(String id) async {
    Query<Map<String, dynamic>> neracaSaldo =
        firestore.collection("neraca_saldo").where("userId", isEqualTo: id);
    var kredit = neracaSaldo.where('debet');
    finalKredit = kredit.snapshots();

    // await finalKredit.then((result) {
    //   print("result:$result");
    // });
    return neracaSaldo.get();
  }

  Future<QuerySnapshot<Object?>> getJurnalUmum(String id) async {
    Query<Map<String, dynamic>> jurnalUmum =
        firestore.collection("jurnal_umum").where("userId", isEqualTo: id);

    return jurnalUmum.get();
  }

  var finalKredit;

  Future<QuerySnapshot<Object?>> getBukuBesar(String id) async {
    Query<Map<String, dynamic>> bukuBesar =
        firestore.collection("buku_besar").where("userId", isEqualTo: id);
    var kredit = bukuBesar.where('debet');
    finalKredit = kredit.snapshots();

    return bukuBesar.get();
  }

  Future<QuerySnapshot<Object?>> getJurnalPenutup(String id) async {
    Query<Map<String, dynamic>> jurnalPenutup =
        firestore.collection("jurnal_penutup").where("userId", isEqualTo: id);
    return jurnalPenutup.get();
  }

  Future<QuerySnapshot<Object?>> getUserData() async {
    CollectionReference userData = firestore.collection("user_data");
    // String userID;
    // if(UserID == user)
    // var userData = firestore
    //     .collection('user_data')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();

    return userData.get();
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

  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";
  List<String> elementText = [];

  void getImageFromCamera() async {
    try {
      scannedText = '';
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        getRecognizedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
    }

    notifyListeners();
  }

  void getRecognizedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          scannedText = scannedText + line.text + " ";
          // print(scannedText);
          // elementText.add(scannedText);
        }
      }
    }

    // print(elementText.length);
    // for (int i = 0; i <= elementText.length; i++) {
    //   print(elementText[i]);

    // int value = int.parse(elementText[i]);
    // print(value);
    // }
    textScanning = false;
    notifyListeners();
  }

  List<Map<String, dynamic>> kreditValue = [];
  int totalKreditNeracaSaldo = 0;

  void getKreditFromFirebase() async {
    final kredit = await FirebaseFirestore.instance
        .collection('neraca_saldo')
        .where('kredit')
        .get();

    kreditValue = kredit.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

  String? getRupiah() {
    final pattern = RegExp(r'Rp\s*\d{1,3}(\.\d{3})*(,\d{2})?');
    final matches = pattern.allMatches(scannedText);
    String? value;

    if (scannedText == null) {
      return null;
    } else {
      for (final match in matches) {
        value = match.group(0);
      }
      return value;
    }
  }
}
