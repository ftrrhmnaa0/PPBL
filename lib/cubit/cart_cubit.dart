
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/produk.dart';

class CartCubit extends Cubit<List<ItemKeranjang>> {
  CartCubit() : super([]);

  // Menghitung jumlah seluruh produk dalam keranjang
  int get totalItem {
    return state.fold(
      0,
      (total, item) => total + item.jumlah,
    );
  }

  // Menghitung total harga seluruh produk
  int get totalHarga {
    return state.fold(
      0,
      (total, item) =>
          total + (item.produk.harga * item.jumlah),
    );
  }

  // Menambahkan produk ke keranjang
  void tambah(Produk produk) {
    final index = state.indexWhere(
      (item) => item.produk.nama == produk.nama,
    );

    final daftarBaru = [...state];

    if (index >= 0) {
      final itemLama = daftarBaru[index];

      daftarBaru[index] = itemLama.copyWith(
        jumlah: itemLama.jumlah + 1,
      );
    } else {
      daftarBaru.add(
        ItemKeranjang(
          produk: produk,
          jumlah: 1,
        ),
      );
    }

    emit(daftarBaru);
  }

  // Mengurangi jumlah produk
  void kurangi(Produk produk) {
    final daftarBaru = [...state];

    final index = daftarBaru.indexWhere(
      (item) => item.produk.nama == produk.nama,
    );

    if (index == -1) return;

    final itemLama = daftarBaru[index];

    if (itemLama.jumlah > 1) {
      daftarBaru[index] = itemLama.copyWith(
        jumlah: itemLama.jumlah - 1,
      );
    } else {
      daftarBaru.removeAt(index);
    }

    emit(daftarBaru);
  }

  // Mengosongkan seluruh keranjang
  void kosongkan() {
    emit([]);
  }
}
