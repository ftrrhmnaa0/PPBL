
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/hasil_prediksi.dart';
import 'prediksi_state.dart';

class PrediksiCubit extends Cubit<PrediksiState> {
  PrediksiCubit() : super(const PrediksiState());

  void tambahPrediksi(HasilPrediksi data) {
    final daftarBaru = [
      data,
      ...state.daftarPrediksi,
    ];

    emit(
      state.copyWith(daftarPrediksi: daftarBaru),
    );
  }

  void hapusPrediksi(HasilPrediksi data) {
    final daftarBaru = List<HasilPrediksi>.from(
      state.daftarPrediksi,
    );

    daftarBaru.remove(data);

    emit(
      state.copyWith(daftarPrediksi: daftarBaru),
    );
  }

  void hapusSemua() {
    emit(
      state.copyWith(daftarPrediksi: []),
    );
  }

  void ubahFilter(String filter) {
    emit(
      state.copyWith(filterPetak: filter),
    );
  }

  void buatDataSimulasi() {
    final random = Random();

    const daftarPetak = ['Petak 1', 'Petak 2'];
    const daftarTanaman = ['Padi', 'Jagung', 'Cabai'];

    final dataSimulasi = List.generate(10, (index) {
      return HasilPrediksi(
        petak: daftarPetak[
          random.nextInt(daftarPetak.length)
        ],
        tanaman: daftarTanaman[
          random.nextInt(daftarTanaman.length)
        ],
        suhuUdara: (18 + random.nextInt(18)).toDouble(),
        kelembapanUdara:
            (40 + random.nextInt(61)).toDouble(),
        kelembapanTanah:
            (20 + random.nextInt(71)).toDouble(),
        namaPetugas: 'Petugas Simulasi',
        waktu: DateTime.now().subtract(
          Duration(hours: index),
        ),
      );
    });

    emit(
      state.copyWith(
        daftarPrediksi: [
          ...dataSimulasi,
          ...state.daftarPrediksi,
        ],
      ),
    );
  }
}
