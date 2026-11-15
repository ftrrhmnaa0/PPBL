import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

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
    LayananPage(),
    WargaPage(),
  ];

  final List<String> judulHalaman = [
    'Beranda',
    'Layanan',
    'Warga',
  ];

  void pilihHalaman(int indeks) {
    setState(() {
      indeksAktif = indeks;
    });
  }

  Widget isiHalaman() {
    return halaman[indeksAktif];
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;
    final layarLebar = lebarLayar >= 600;

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
              'Anda sedang berada di halaman Beranda.',
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
                    Icons.location_city,
                    size: 45,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nusantara Cerdas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
              icon: Icon(Icons.miscellaneous_services_outlined),
              selectedIcon: Icon(Icons.miscellaneous_services),
              label: Text('Layanan'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Warga'),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 8),
              child: Text('Menu Pendukung'),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan Kota'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  AppRoutes.pengaturan,
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  AppRoutes.tentang,
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menu Keluar dipilih.'),
                  ),
                );
              },
            ),
          ],
        ),

        body: layarLebar
            ? Row(
                children: [
                  NavigationRail(
                    selectedIndex: indeksAktif,
                    onDestinationSelected: pilihHalaman,
                    labelType: NavigationRailLabelType.all,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: Text('Beranda'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.miscellaneous_services_outlined,
                        ),
                        selectedIcon: Icon(
                          Icons.miscellaneous_services,
                        ),
                        label: Text('Layanan'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: Text('Warga'),
                      ),
                    ],
                  ),

                  const VerticalDivider(
                    width: 1,
                  ),

                  Expanded(
                    child: isiHalaman(),
                  ),
                ],
              )
            : isiHalaman(),

        bottomNavigationBar: layarLebar
            ? null
            : NavigationBar(
                selectedIndex: indeksAktif,
                onDestinationSelected: pilihHalaman,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.miscellaneous_services_outlined,
                    ),
                    selectedIcon: Icon(
                      Icons.miscellaneous_services,
                    ),
                    label: 'Layanan',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Warga',
                  ),
                ],
              ),
      ),
    );
  }
}