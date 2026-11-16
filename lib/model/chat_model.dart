import 'package:flutter/foundation.dart';

class Pesan {
  final String teks;
  final bool dariPembeli;

  Pesan({
    required this.teks,
    required this.dariPembeli,
  });
}

class ChatModel extends ChangeNotifier {
  final List<Pesan> _daftarPesan = [
    Pesan(
      teks: 'Selamat datang di Peukan Rumoh. Ada yang bisa dibantu?',
      dariPembeli: false,
    ),
  ];

  List<Pesan> get daftarPesan =>
      List.unmodifiable(_daftarPesan);

  int get totalPesan => _daftarPesan.length;

  void kirimPesan(String teks, bool dariPembeli) {
    if (teks.trim().isEmpty) return;

    _daftarPesan.add(
      Pesan(
        teks: teks.trim(),
        dariPembeli: dariPembeli,
      ),
    );

    notifyListeners();
  }
}