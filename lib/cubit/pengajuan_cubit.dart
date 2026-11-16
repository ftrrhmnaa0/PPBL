
import 'package:flutter_bloc/flutter_bloc.dart';

class PengajuanCubit extends Cubit<List<String>> {
  PengajuanCubit() : super([]);

  int get totalPengajuan => state.length;

  void tambah(String namaLayanan) {
    final daftarBaru = List<String>.from(state);

    if (!daftarBaru.contains(namaLayanan)) {
      daftarBaru.add(namaLayanan);
    }

    emit(daftarBaru);
  }

  void hapus(String namaLayanan) {
    final daftarBaru = List<String>.from(state);
    daftarBaru.remove(namaLayanan);

    emit(daftarBaru);
  }

  void kosongkan() {
    emit([]);
  }
}
