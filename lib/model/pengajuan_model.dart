import 'package:flutter/foundation.dart';

class Pengajuan {
  final String nama;
  final String email;
  final String bidang;
  final String sesi;
  bool selesai;

  Pengajuan({
    required this.nama,
    required this.email,
    required this.bidang,
    required this.sesi,
    this.selesai = false,
  });
}

class PengajuanModel extends ChangeNotifier {
  final List<Pengajuan> _daftar = [];

  List<Pengajuan> get daftar => List.unmodifiable(_daftar);

  void tambah(Pengajuan pengajuan) {
    _daftar.add(pengajuan);
    notifyListeners();
  }

  void tandaiSelesai(Pengajuan pengajuan) {
    pengajuan.selesai = true;
    notifyListeners();
  }

  int jumlahBidang(String bidang) {
    return _daftar.where((p) => p.bidang == bidang).length;
  }

  int get totalPengajuan => _daftar.length;
}