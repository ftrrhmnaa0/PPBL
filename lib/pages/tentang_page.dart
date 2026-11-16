
import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Tujuan Aplikasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'AgriClima LSTM digunakan untuk mencatat hasil '
            'prediksi mikroklimat tanaman, menampilkan riwayat, '
            'dan memberikan rekomendasi perawatan berdasarkan '
            'kelembapan tanah.',
          ),
          SizedBox(height: 20),
          Text(
            'Lokasi Pemantauan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Petak 1'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Petak 2'),
          ),
          SizedBox(height: 12),
          Text(
            'Parameter Mikroklimat',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.thermostat),
            title: Text('Suhu Udara'),
          ),
          ListTile(
            leading: Icon(Icons.water_drop_outlined),
            title: Text('Kelembapan Udara'),
          ),
          ListTile(
            leading: Icon(Icons.grass),
            title: Text('Kelembapan Tanah'),
          ),
        ],
      ),
    );
  }
}
