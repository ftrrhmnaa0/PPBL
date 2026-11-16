
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/hasil_prediksi.dart';
import '../state/prediksi_cubit.dart';

class InputPrediksiPage extends StatefulWidget {
  const InputPrediksiPage({super.key});

  @override
  State<InputPrediksiPage> createState() =>
      _InputPrediksiPageState();
}

class _InputPrediksiPageState extends State<InputPrediksiPage> {
  final _formKey = GlobalKey<FormState>();

  final suhuController = TextEditingController();
  final kelembapanUdaraController = TextEditingController();
  final kelembapanTanahController = TextEditingController();
  final petugasController = TextEditingController();

  String petak = 'Petak 1';
  String? tanaman;
  bool dataBenar = false;

  @override
  void dispose() {
    suhuController.dispose();
    kelembapanUdaraController.dispose();
    kelembapanTanahController.dispose();
    petugasController.dispose();
    super.dispose();
  }

  String? validasiAngka(String? value, String nama) {
    if (value == null || value.trim().isEmpty) {
      return '$nama wajib diisi';
    }

    if (double.tryParse(value) == null) {
      return '$nama harus berupa angka';
    }

    return null;
  }

  String? validasiPersentase(String? value, String nama) {
    final error = validasiAngka(value, nama);

    if (error != null) return error;

    final angka = double.parse(value!);

    if (angka < 0 || angka > 100) {
      return '$nama harus berada pada rentang 0–100';
    }

    return null;
  }

  Future<void> simpanData() async {
    if (!_formKey.currentState!.validate()) return;

    if (tanaman == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih nama tanaman'),
        ),
      );
      return;
    }

    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Data'),
          content: const Text(
            'Apakah data prediksi yang dimasukkan sudah benar?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Periksa Lagi'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Ya, Simpan'),
            ),
          ],
        );
      },
    );

    if (konfirmasi != true || !mounted) return;

    final data = HasilPrediksi(
      petak: petak,
      tanaman: tanaman!,
      suhuUdara: double.parse(suhuController.text),
      kelembapanUdara:
          double.parse(kelembapanUdaraController.text),
      kelembapanTanah:
          double.parse(kelembapanTanahController.text),
      namaPetugas: petugasController.text.trim(),
      waktu: DateTime.now(),
    );

    context.read<PrediksiCubit>().tambahPrediksi(data);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data tersimpan'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Hasil Prediksi'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Lokasi Petak',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text('Petak 1'),
              value: 'Petak 1',
              groupValue: petak,
              onChanged: (value) {
                setState(() {
                  petak = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Petak 2'),
              value: 'Petak 2',
              groupValue: petak,
              onChanged: (value) {
                setState(() {
                  petak = value!;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: tanaman,
              decoration: const InputDecoration(
                labelText: 'Nama Tanaman',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Padi',
                  child: Text('Padi'),
                ),
                DropdownMenuItem(
                  value: 'Jagung',
                  child: Text('Jagung'),
                ),
                DropdownMenuItem(
                  value: 'Cabai',
                  child: Text('Cabai'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  tanaman = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Nama tanaman wajib dipilih';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: suhuController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9.]'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Prediksi Suhu Udara (°C)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return validasiAngka(value, 'Suhu udara');
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: kelembapanUdaraController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prediksi Kelembapan Udara (%)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return validasiPersentase(
                  value,
                  'Kelembapan udara',
                );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: kelembapanTanahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Prediksi Kelembapan Tanah (%)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return validasiPersentase(
                  value,
                  'Kelembapan tanah',
                );
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: petugasController,
              decoration: const InputDecoration(
                labelText: 'Nama Petugas',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama petugas wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data sudah benar'),
              value: dataBenar,
              onChanged: (value) {
                setState(() {
                  dataBenar = value ?? false;
                });
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: dataBenar ? simpanData : null,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
