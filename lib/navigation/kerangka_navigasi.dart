
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
  int halamanAktif = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  void pindahHalaman(int index) {
    setState(() {
      halamanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          if (lebarLayar >= 700)
            NavigationRail(
              selectedIndex: halamanAktif,
              onDestinationSelected: pindahHalaman,
              labelType: NavigationRailLabelType.all,

              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),

                const NavigationRailDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  selectedIcon: Icon(Icons.list_alt),
                  label: Text('Layanan'),
                ),

                NavigationRailDestination(
                  icon: IkonWargaDenganBadge(
                    icon: Icons.people_outline,
                  ),
                  selectedIcon: IkonWargaDenganBadge(
                    icon: Icons.people,
                  ),
                  label: const Text('Warga'),
                ),
              ],
            ),

          Expanded(
            child: IndexedStack(
              index: halamanAktif,
              children: halaman,
            ),
          ),
        ],
      ),

      bottomNavigationBar: lebarLayar < 700
          ? NavigationBar(
              selectedIndex: halamanAktif,
              onDestinationSelected: pindahHalaman,

              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),

                const NavigationDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  selectedIcon: Icon(Icons.list_alt),
                  label: 'Layanan',
                ),

                NavigationDestination(
                  icon: IkonWargaDenganBadge(
                    icon: Icons.people_outline,
                  ),
                  selectedIcon: IkonWargaDenganBadge(
                    icon: Icons.people,
                  ),
                  label: 'Warga',
                ),
              ],
            )
          : null,
    );
  }
}

class IkonWargaDenganBadge extends StatelessWidget {
  final IconData icon;

  const IkonWargaDenganBadge({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PengajuanCubit, List<String>, int>(
      selector: (daftarPengajuan) {
        return daftarPengajuan.length;
      },

      builder: (context, jumlahPengajuan) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon),

            if (jumlahPengajuan > 0)
              Positioned(
                right: -8,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),

                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),

                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),

                  child: Text(
                    jumlahPengajuan > 99
                        ? '99+'
                        : jumlahPengajuan.toString(),

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
