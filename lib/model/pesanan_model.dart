import 'package:flutter/foundation.dart';

class Pesanan {
  final String namaPembeli;
  final String namaProduk;
  final String alamat;
  final String metodePengiriman;

  Pesanan({
    required this.namaPembeli,
    required this.namaProduk,
    required this.alamat,
    required this.metodePengiriman,
  });
}

class PesananModel extends ChangeNotifier {
  final List<Pesanan> _daftarPesanan = [];

  List<Pesanan> get daftarPesanan =>
      List.unmodifiable(_daftarPesanan);

  int get totalPesanan => _daftarPesanan.length;

  void tambahPesanan(Pesanan pesanan) {
    _daftarPesanan.add(pesanan);
    notifyListeners();
  }
}