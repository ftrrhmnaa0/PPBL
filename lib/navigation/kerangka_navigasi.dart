
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';
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
  int indeks = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    JelajahiPage(),
    KeranjangPage(),
    PesananPage(),
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
            label: 'Beranda',
          ),
          const NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Jelajahi',
          ),
          NavigationDestination(
            icon: BlocSelector<CartCubit,
                List<ItemKeranjang>, int>(
              selector: (state) {
                return state.fold(
                  0,
                  (total, item) => total + item.jumlah,
                );
              },
              builder: (context, total) {
                return Badge(
                  label: Text('$total'),
                  isLabelVisible: total > 0,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                );
              },
            ),
            label: 'Keranjang',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Pesanan',
          ),
        ],
      ),
    );
  }
}
