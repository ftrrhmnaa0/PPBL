import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/jelajahi_page.dart';
import '../pages/keranjang_page.dart';
import '../pages/pesanan_page.dart';

import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    JelajahiPage(),
    KeranjangPage(),
    PesananPage(),
  ];

  final List<String> judulHalaman = [
    'Peukan Rumoh',
    'Jelajahi Produk',
    'Keranjang',
    'Pesanan Saya',
  ];

  void pilihHalaman(int indeks) {
    setState(() {
      indeksAktif = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (indeksAktif != 0) {
          setState(() {
            indeksAktif = 0;
          });

          return false;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Anda sedang berada di Beranda Peukan Rumoh.',
            ),
          ),
        );

        return false;
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text(judulHalaman[indeksAktif]),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),

        drawer: NavigationDrawer(
          selectedIndex: indeksAktif,

          onDestinationSelected: (indeks) {
            Navigator.pop(context);
            pilihHalaman(indeks);
          },

          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 20, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.storefront,
                    size: 45,
                    color: Colors.teal,
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Peukan Rumoh',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Marketplace Pasar Tradisional',
                  ),
                ],
              ),
            ),

            const Divider(),

            const NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.search),
              selectedIcon: Icon(Icons.search),
              label: Text('Jelajahi'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(Icons.shopping_cart),
              label: Text('Keranjang'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: Text('Pesanan'),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 8),
              child: Text('Menu Pendukung'),
            ),

            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  AppRoutes.profil,
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Peukan Rumoh'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  AppRoutes.tentang,
                );
              },
            ),
          ],
        ),

        body: halaman[indeksAktif],

        bottomNavigationBar: NavigationBar(
          selectedIndex: indeksAktif,
          onDestinationSelected: pilihHalaman,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Beranda',
            ),

            NavigationDestination(
              icon: Icon(Icons.search),
              selectedIcon: Icon(Icons.search),
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
      ),
    );
  }
}