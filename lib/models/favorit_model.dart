import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _layananFavorit = {};

  List<String> get layananFavorit =>
      List.unmodifiable(_layananFavorit);

  bool isFavorit(String namaLayanan) {
    return _layananFavorit.contains(namaLayanan);
  }

  void tandai(String namaLayanan) {
    final berhasilDitambahkan = _layananFavorit.add(namaLayanan);

    if (berhasilDitambahkan) {
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    final berhasilDihapus = _layananFavorit.remove(namaLayanan);

    if (berhasilDihapus) {
      notifyListeners();
    }
  }
}