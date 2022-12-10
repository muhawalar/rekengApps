import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/user_provider.dart';

class UserData {
  String userID;
  String username;
  String email;
  UserData(
    this.userID,
    this.email, {
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'username': username,
        'email': email,
      };
  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      json['userID'],
      json['email'],
      username: json['username'],
    );
  }
}

class Pemasukan {
  String pemasukanId;
  String userID;
  // String pilihan;
  String nama;
  int debet;
  String tanggal;
  int kredit;
  // String invoiceUrl;

  Pemasukan({
    this.userID = '',
    this.pemasukanId = '',
    // required this.pilihan,
    required this.nama,
    required this.debet,
    required this.tanggal,
    this.kredit = 0,
    // required this.invoiceUrl
  });

  Map<String, dynamic> toJson() => {
        'userId': userID,
        'kode_rek': pemasukanId,
        // 'pilihan': pilihan,
        'rekening': nama,
        'debet': debet,
        'tanggal': tanggal,
        'kredit': kredit
        // 'invoiceUrl': invoiceUrl
      };

  static Pemasukan fromJson(Map<String, dynamic> json) {
    return Pemasukan(
      pemasukanId: json['kode_rek'],
      // pilihan: json['pilihan'],
      nama: json['rekening'],
      debet: json['debet'],
      tanggal: json['tanggal'],
      kredit: json['kredit'],
      // invoiceUrl: json['invoiceUrl']
    );
  }
}

class PemasukanJurnalUmum {
  String userID;
  String ref;
  // String pilihan;
  String nama;
  int debet;
  String tanggal;
  int kredit;
  // String invoiceUrl;

  PemasukanJurnalUmum({
    this.userID = '',
    this.ref = '',
    // required this.pilihan,
    required this.nama,
    required this.debet,
    required this.tanggal,
    this.kredit = 0,
    // required this.invoiceUrl
  });

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'ref': ref,
        // 'pilihan': pilihan,
        'keterangan': nama,
        'debet': debet,
        'tanggal': tanggal,
        'kredit': kredit
        // 'invoiceUrl': invoiceUrl
      };

  static PemasukanJurnalUmum fromJson(Map<String, dynamic> json) {
    return PemasukanJurnalUmum(
      ref: json['ref'],
      // pilihan: json['pilihan'],
      nama: json['keterangan'],
      debet: json['debet'],
      tanggal: json['tanggal'],
      kredit: json['kredit'],
      // invoiceUrl: json['invoiceUrl']
    );
  }
}

class Pengeluaran {
  String pengeluaranId;
  // String pilihan;
  String nama;
  int debet;
  String tanggal;
  int kredit;
  // String invoiceUrl;

  Pengeluaran({
    this.pengeluaranId = '',
    // required this.pilihan,
    required this.nama,
    this.debet = 0,
    required this.tanggal,
    required this.kredit,
    // required this.invoiceUrl
  });

  Map<String, dynamic> toJson() => {
        'kode_rek': pengeluaranId,
        // 'pilihan': pilihan,
        'rekening': nama,
        'debet': debet,
        'tanggal': tanggal,
        'kredit': kredit
        // 'invoiceUrl': invoiceUrl
      };

  static Pengeluaran fromJson(Map<String, dynamic> json) {
    return Pengeluaran(
      pengeluaranId: json['kode_rek'],
      // pilihan: json['pilihan'],
      nama: json['rekening'],
      debet: json['debet'],
      tanggal: json['tanggal'],
      kredit: json['kredit'],
      // invoiceUrl: json['invoiceUrl']
    );
  }
}

class PengeluaranJurnalUmum {
  String ref;
  // String pilihan;
  String nama;
  int debet;
  String tanggal;
  int kredit;
  // String invoiceUrl;

  PengeluaranJurnalUmum({
    this.ref = '',
    // required this.pilihan,
    required this.nama,
    this.debet = 0,
    required this.tanggal,
    required this.kredit,
    // required this.invoiceUrl
  });

  Map<String, dynamic> toJson() => {
        'ref': ref,
        // 'pilihan': pilihan,
        'keterangan': nama,
        'debet': debet,
        'tanggal': tanggal,
        'kredit': kredit
        // 'invoiceUrl': invoiceUrl
      };

  static PengeluaranJurnalUmum fromJson(Map<String, dynamic> json) {
    return PengeluaranJurnalUmum(
      ref: json['ref'],
      // pilihan: json['pilihan'],
      nama: json['keterangan'],
      debet: json['debet'],
      tanggal: json['tanggal'],
      kredit: json['kredit'],
      // invoiceUrl: json['invoiceUrl']
    );
  }
}
