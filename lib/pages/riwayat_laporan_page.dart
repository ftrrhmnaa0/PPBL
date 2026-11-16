import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() =>
      _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState
    extends State<RiwayatLaporanPage> {
  final List<String> laporan = [
    'Laporan lampu jalan mati',
    'Laporan sampah menumpuk',
    'Laporan kerusakan jalan',
  ];

  void tambahLaporan() {
    setState(() {
      laporan.add(
        'Laporan baru ${laporan.length + 1}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: laporan.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.report,
                color: Colors.teal,
              ),
              title: Text(laporan[index]),
              subtitle: const Text(
                'Status: Dalam proses',
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: tambahLaporan,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu riwayat dipilih'),
                  ),
                );
              },
              icon: const Icon(Icons.history),
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu filter dipilih'),
                  ),
                );
              },
              icon: const Icon(Icons.filter_list),
            ),

            const SizedBox(width: 40),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu bagikan dipilih'),
                  ),
                );
              },
              icon: const Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}