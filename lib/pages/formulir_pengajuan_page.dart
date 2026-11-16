import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pengajuan_model.dart';

class FormulirPengajuanPage extends StatefulWidget {
  final String bidang;

  const FormulirPengajuanPage({
    super.key,
    required this.bidang,
  });

  @override
  State<FormulirPengajuanPage> createState() =>
      _FormulirPengajuanPageState();
}

class _FormulirPengajuanPageState
    extends State<FormulirPengajuanPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();

  bool setuju = false;
  bool sedangMengirim = false;
  String? sesiTerpilih;

  bool get formLengkap {
    return namaController.text.trim().isNotEmpty &&
        emailController.text.contains('@') &&
        setuju &&
        sesiTerpilih != null;
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> kirimPengajuan() async {
    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.read<PengajuanModel>().tambah(
      Pengajuan(
        nama: namaController.text,
        email: emailController.text,
        bidang: widget.bidang,
        sesi: sesiTerpilih!,
      ),
    );

    setState(() {
      sedangMengirim = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengajuan berhasil dikirim'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pengajuan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bidang: ${widget.bidang}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: emailController.text.isNotEmpty &&
                        !emailController.text.contains('@')
                    ? 'Email harus mengandung karakter @'
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 12),

            CheckboxListTile(
              value: setuju,
              title: const Text(
                'Saya menyetujui penggunaan data pribadi',
              ),
              onChanged: (nilai) {
                setState(() {
                  setuju = nilai ?? false;
                });
              },
            ),

            const SizedBox(height: 12),

            const Text(
              'Pilih Sesi Kunjungan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ...['Pagi', 'Siang', 'Sore'].map((sesi) {
              return RadioListTile<String>(
                title: Text('Sesi $sesi'),
                value: sesi,
                groupValue: sesiTerpilih,
                onChanged: (nilai) {
                  setState(() {
                    sesiTerpilih = nilai;
                  });
                },
              );
            }),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: formLengkap && !sedangMengirim
                    ? kirimPengajuan
                    : null,
                child: sedangMengirim
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Kirim Pengajuan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}