
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/prediksi_cubit.dart';
import '../state/prediksi_state.dart';
import '../pages/beranda_page.dart';
import '../pages/prediksi_page.dart';
import '../pages/statistik_page.dart';
import '../pages/pengaturan_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<String> judulHalaman = [
    'Beranda',
    'Prediksi',
    'Statistik',
    'Pengaturan',
  ];

  final List<Widget> daftarHalaman = const [
    BerandaPage(),
    PrediksiPage(),
    StatistikPage(),
    PengaturanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgriClima - ${judulHalaman[indeksAktif]}'),
      ),
      body: IndexedStack(
        index: indeksAktif,
        children: daftarHalaman,
      ),
      bottomNavigationBar:
          BlocBuilder<PrediksiCubit, PrediksiState>(
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: indeksAktif,
            onDestinationSelected: (index) {
              setState(() {
                indeksAktif = index;
              });
            },
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Beranda',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text(
                    '${state.totalPerluTindakan}',
                  ),
                  isLabelVisible:
                      state.totalPerluTindakan > 0,
                  child: const Icon(
                    Icons.analytics_outlined,
                  ),
                ),
                selectedIcon: Badge(
                  label: Text(
                    '${state.totalPerluTindakan}',
                  ),
                  isLabelVisible:
                      state.totalPerluTindakan > 0,
                  child: const Icon(Icons.analytics),
                ),
                label: 'Prediksi',
              ),
              const NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: 'Statistik',
              ),
              const NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Pengaturan',
              ),
            ],
          );
        },
      ),
    );
  }
}
