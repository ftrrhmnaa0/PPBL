
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';

import '../pages/beranda_page.dart';
import '../pages/jelajahi_page.dart';
import '../pages/keranjang_page.dart';
import '../pages/pesanan_page.dart';

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
    JelajahiPage(),
    KeranjangPage(),
    PesananPage(),
  ];

  void pindahHalaman(int index) {
    setState(() {
      halamanAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalItem = context.select<CartCubit, int>(
      (cubit) => cubit.totalItem,
    );

    final lebarLayar = MediaQuery.of(context).size.width;

    final tujuanNavigasi = [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Beranda',
      ),

      const NavigationDestination(
        icon: Icon(Icons.search),
        selectedIcon: Icon(Icons.search),
        label: 'Jelajahi',
      ),

      NavigationDestination(
        icon: Badge(
          isLabelVisible: totalItem > 0,
          label: Text(
            totalItem > 99 ? '99+' : '$totalItem',
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        selectedIcon: Badge(
          isLabelVisible: totalItem > 0,
          label: Text(
            totalItem > 99 ? '99+' : '$totalItem',
          ),
          child: const Icon(
            Icons.shopping_cart,
          ),
        ),
        label: 'Keranjang',
      ),

      const NavigationDestination(
        icon: Icon(Icons.receipt_long_outlined),
        selectedIcon: Icon(Icons.receipt_long),
        label: 'Pesanan',
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          if (lebarLayar >= 600)
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
                  icon: Icon(Icons.search),
                  selectedIcon: Icon(Icons.search),
                  label: Text('Jelajahi'),
                ),

                NavigationRailDestination(
                  icon: Badge(
                    isLabelVisible: totalItem > 0,
                    label: Text('$totalItem'),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                  selectedIcon: Badge(
                    isLabelVisible: totalItem > 0,
                    label: Text('$totalItem'),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  label: const Text('Keranjang'),
                ),

                const NavigationRailDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(Icons.receipt_long),
                  label: Text('Pesanan'),
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

      bottomNavigationBar: lebarLayar < 600
          ? NavigationBar(
              selectedIndex: halamanAktif,
              onDestinationSelected: pindahHalaman,
              destinations: tujuanNavigasi,
            )
          : null,
    );
  }
}
