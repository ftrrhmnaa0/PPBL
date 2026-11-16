import 'package:flutter/material.dart';

import '../pages/warga_page.dart';
import '../pages/chat_page.dart';
import '../pages/peta_page.dart';
import '../pages/statistik_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeks = 0;

  final List<Widget> halaman = const [
    WargaPage(),
    ChatPage(),
    PetaPage(),
    StatistikPage(),
  ];

  final List<String> judul = [
    'Warga',
    'Tanya Petugas',
    'Lokasi Kantor',
    'Statistik Layanan',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layarLebar = constraints.maxWidth >= 600;

        return Scaffold(
          appBar: AppBar(
            title: Text(judul[indeks]),
          ),
          body: Row(
            children: [
              if (layarLebar)
                NavigationRail(
                  selectedIndex: indeks,
                  onDestinationSelected: (nilai) {
                    setState(() {
                      indeks = nilai;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.people),
                      label: Text('Warga'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.chat),
                      label: Text('Chat'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.map),
                      label: Text('Peta'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.bar_chart),
                      label: Text('Statistik'),
                    ),
                  ],
                ),
              Expanded(
                child: IndexedStack(
                  index: indeks,
                  children: halaman,
                ),
              ),
            ],
          ),
          bottomNavigationBar: layarLebar
              ? null
              : NavigationBar(
                  selectedIndex: indeks,
                  onDestinationSelected: (nilai) {
                    setState(() {
                      indeks = nilai;
                    });
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.people),
                      label: 'Warga',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.chat),
                      label: 'Chat',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.map),
                      label: 'Peta',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.bar_chart),
                      label: 'Statistik',
                    ),
                  ],
                ),
        );
      },
    );
  }
}