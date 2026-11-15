import 'package:flutter/material.dart';

import '/pages/beranda_page.dart';
import '/pages/jelajahi_page.dart';
import '/pages/keranjang_page.dart';
import '/pages/pesanan_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  static const List<Widget> _halaman = [
    BerandaPage(),
    JelajahiPage(),
    KeranjangPage(),
    PesananPage(),
  ];

  static const List<String> _judul = [
    'Peukan Rumoh',
    'Jelajahi Produk',
    'Keranjang',
    'Pesanan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_indeksTerpilih]),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _indeksTerpilih,
        onDestinationSelected: (indeks) {
          Navigator.pop(context);

          setState(() {
            _indeksTerpilih = indeks;
          });
        },
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Peukan Rumoh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.search),
            label: Text('Jelajahi'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: Text('Keranjang'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: Text('Pesanan'),
          ),
        ],
      ),
      body: IndexedStack(
        index: _indeksTerpilih,
        children: _halaman,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indeksTerpilih,
        onDestinationSelected: (indeks) {
          setState(() {
            _indeksTerpilih = indeks;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.manage_search),
            label: 'Jelajahi',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Pesanan',
          ),
        ],
      ),
    );
  }
}