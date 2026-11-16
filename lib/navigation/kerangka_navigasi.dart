
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeks = 0;

  final halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: indeks,
        children: halaman,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indeks,
        onDestinationSelected: (value) {
          setState(() {
            indeks = value;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          const NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: 'Layanan',
          ),
          NavigationDestination(
            icon: BlocSelector<PengajuanCubit,
                List<String>, int>(
              selector: (state) => state.length,
              builder: (context, total) {
                return Badge(
                  label: Text('$total'),
                  isLabelVisible: total > 0,
                  child: const Icon(Icons.people_outline),
                );
              },
            ),
            label: 'Warga',
          ),
        ],
      ),
    );
  }
}
