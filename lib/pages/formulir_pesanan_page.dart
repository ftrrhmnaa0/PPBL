import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pesanan_model.dart';

class FormulirPesananPage extends StatefulWidget {
  const FormulirPesananPage({super.key});

  @override
  State<FormulirPesananPage> createState() =>
      _FormulirPesananPageState();
}

class _FormulirPesananPageState
    extends State<FormulirPesananPage> {
  final namaController = TextEditingController();
  final produkController = TextEditingController();
  final alamatController = TextEditingController();

  bool setuju = false;
  bool sedangMengirim = false;
  String? metodePengiriman;

  bool get formLengkap {
    return namaController.text.trim().isNotEmpty &&
        produkController.text.trim().isNotEmpty &&
        alamatController.text.trim().isNotEmpty &&
        setuju &&
        metodePengiriman != null;
  }

  @override
  void dispose() {
    namaController.dispose();
    produkController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  Future<void> kirimPesanan() async {
    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.read<PesananModel>().tambahPesanan(
      Pesanan(
        namaPembeli: namaController.text,
        namaProduk: produkController.text,
        alamat: alamatController.text,
        metodePengiriman: metodePengiriman!,
      ),
    );

    setState(() {
      sedangMengirim = false;
      namaController.clear();
      produkController.clear();
      alamatController.clear();
      setuju = false;
      metodePengiriman = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pesanan berhasil dibuat'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pembeli',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: produkController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: alamatController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            CheckboxListTile(
              value: setuju,
              title: const Text(
                'Saya menyetujui data pemesanan',
              ),
              onChanged: (nilai) {
                setState(() {
                  setuju = nilai ?? false;
                });
              },
            ),

            const SizedBox(height: 12),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Metode Pengiriman',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            RadioListTile<String>(
              title: const Text('Diantar ke alamat'),
              value: 'Diantar',
              groupValue: metodePengiriman,
              onChanged: (nilai) {
                setState(() {
                  metodePengiriman = nilai;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Ambil di pasar'),
              value: 'Ambil sendiri',
              groupValue: metodePengiriman,
              onChanged: (nilai) {
                setState(() {
                  metodePengiriman = nilai;
                });
              },
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: formLengkap && !sedangMengirim
                    ? kirimPesanan
                    : null,
                child: sedangMengirim
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Buat Pesanan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}