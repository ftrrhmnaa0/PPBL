
class DataPerawatan {
  static const Map<String, String> catatan = {
    'Padi':
        'Jaga genangan air 2–5 cm pada fase vegetatif '
        'dan keringkan lahan menjelang panen.',

    'Jagung':
        'Siram saat tanah mulai kering dan hindari '
        'genangan di sekitar perakaran.',

    'Cabai':
        'Gunakan mulsa untuk menjaga kelembapan tanah '
        'dan siram pada pagi atau sore hari.',
  };

  static String getCatatan(String tanaman) {
    return catatan[tanaman] ?? 'Catatan perawatan belum tersedia.';
  }
}
