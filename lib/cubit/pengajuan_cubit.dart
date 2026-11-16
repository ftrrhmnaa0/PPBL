
import 'package:flutter_bloc/flutter_bloc.dart';

class PengajuanCubit extends Cubit<List<String>> {
  PengajuanCubit() : super([]);

  void tambah(String namaLayanan) {
    emit([...state, namaLayanan]);
  }

  void hapus(String namaLayanan) {
    final daftarBaru = [...state];

    daftarBaru.remove(namaLayanan);

    emit(daftarBaru);
  }

  void kosongkan() {
    emit([]);
  }

  int get totalPengajuan => state.length;
}
