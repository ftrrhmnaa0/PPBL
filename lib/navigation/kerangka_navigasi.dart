import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/formulir_pesanan_page.dart';
import '../pages/pesanan_page.dart';
import '../pages/chat_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeks = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    FormulirPesananPage(),
    PesananPage(),
    ChatPage(),
  ];

  final List<String> judul = [
    'Peukan Rumoh',
    'Pemesanan',
    'Pesanan Saya',
    'Chat Penjual',
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
                      icon: Icon(Icons.home),
                      label: Text('Beranda'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_bag),
                      label: Text('Pemesanan'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.receipt_long),
                      label: Text('Pesanan'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.chat),
                      label: Text('Chat'),
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
                      icon: Icon(Icons.home),
                      label: 'Beranda',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.shopping_bag),
                      label: 'Pemesanan',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.receipt_long),
                      label: 'Pesanan',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.chat),
                      label: 'Chat',
                    ),
                  ],
                ),
        );
      },
    );
  }
}