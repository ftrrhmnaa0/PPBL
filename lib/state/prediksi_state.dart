
import '../models/hasil_prediksi.dart';

class PrediksiState {
  final List<HasilPrediksi> daftarPrediksi;
  final String filterPetak;

  const PrediksiState({
    this.daftarPrediksi = const [],
    this.filterPetak = 'Semua',
  });

  List<HasilPrediksi> get prediksiTerfilter {
    if (filterPetak == 'Semua') {
      return daftarPrediksi;
    }

    return daftarPrediksi
        .where((data) => data.petak == filterPetak)
        .toList();
  }

  int get totalPrediksi => daftarPrediksi.length;

  int get totalOptimal {
    return daftarPrediksi
        .where((data) => data.status == 'Optimal')
        .length;
  }

  int get totalPerluTindakan {
    return daftarPrediksi
        .where((data) =>
            data.status == 'Kering' ||
            data.status == 'Terlalu Lembap')
        .length;
  }

  int get totalKering {
    return daftarPrediksi
        .where((data) => data.status == 'Kering')
        .length;
  }

  int get totalTerlaluLembap {
    return daftarPrediksi
        .where((data) => data.status == 'Terlalu Lembap')
        .length;
  }

  PrediksiState copyWith({
    List<HasilPrediksi>? daftarPrediksi,
    String? filterPetak,
  }) {
    return PrediksiState(
      daftarPrediksi: daftarPrediksi ?? this.daftarPrediksi,
      filterPetak: filterPetak ?? this.filterPetak,
    );
  }
}
