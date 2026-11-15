import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/pengajuan_model.dart';
import '/pages/beranda_page.dart';
import '/pages/layanan_page.dart';
import '/pages/warga_page.dart';

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
    LayananPage(),
    WargaPage(),
  ];

  static const List<String> _judul = [
    'Beranda',
    'Layanan',
    'Warga',
  ];

  void _pilihHalaman(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layarLebar = constraints.maxWidth >= 600;

        return Scaffold(
          appBar: AppBar(
            title: Text(_judul[_indeksTerpilih]),
          ),
          drawer: NavigationDrawer(
            selectedIndex: _indeksTerpilih,
            onDestinationSelected: (indeks) {
              Navigator.pop(context);
              _pilihHalaman(indeks);
            },
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
                child: Text(
                  'Nusantara Cerdas Mobile',
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
                icon: Icon(Icons.miscellaneous_services_outlined),
                selectedIcon: Icon(Icons.miscellaneous_services),
                label: Text('Layanan'),
              ),
              NavigationDrawerDestination(
                icon: Icon(Icons.people_outline),
                selectedIcon: Icon(Icons.people),
                label: Text('Warga'),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(28, 8, 16, 8),
                child: Text('Menu lainnya'),
              ),
            ],
          ),
          body: Row(
            children: [
              if (layarLebar)
                NavigationRail(
                  selectedIndex: _indeksTerpilih,
                  onDestinationSelected: _pilihHalaman,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Beranda'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: Text('Layanan'),
                    ),
                    NavigationRailDestination(
                      icon: BadgePengajuan(
                        child: const Icon(Icons.people_outline),
                      ),
                      selectedIcon: BadgePengajuan(
                        child: const Icon(Icons.people),
                      ),
                      label: const Text('Warga'),
                    ),
                  ],
                ),
              Expanded(
                child: _halaman[_indeksTerpilih],
              ),
            ],
          ),
          bottomNavigationBar: layarLebar
              ? null
              : NavigationBar(
                  selectedIndex: _indeksTerpilih,
                  onDestinationSelected: _pilihHalaman,
                  destinations: [
                    const NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Beranda',
                    ),
                    const NavigationDestination(
                      icon: Icon(Icons.miscellaneous_services_outlined),
                      selectedIcon: Icon(Icons.miscellaneous_services),
                      label: 'Layanan',
                    ),
                    NavigationDestination(
                      icon: BadgePengajuan(
                        child: const Icon(Icons.people_outline),
                      ),
                      selectedIcon: BadgePengajuan(
                        child: const Icon(Icons.people),
                      ),
                      label: 'Warga',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class BadgePengajuan extends StatelessWidget {
  final Widget child;

  const BadgePengajuan({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final jumlah = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    if (jumlah == 0) {
      return child;
    }

    return Badge(
      label: Text('$jumlah'),
      child: child,
    );
  }
}