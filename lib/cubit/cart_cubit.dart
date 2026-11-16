import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/produk.dart';

class CartCubit extends Cubit<List<ItemKeranjang>> {
  CartCubit() : super([]);

  int get totalItem {
    return state.fold(
      0,
      (total, item) => total + item.jumlah,
    );
  }

  int get totalHarga {
    return state.fold(
      0,
      (total, item) => total + item.subtotal,
    );
  }

  void tambah(Produk produk) {
    final daftarBaru = List<ItemKeranjang>.from(state);

    final index = daftarBaru.indexWhere(
      (item) => item.produk.id == produk.id,
    );

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

  void kurangi(Produk produk) {
    final daftarBaru = List<ItemKeranjang>.from(state);

    final index = daftarBaru.indexWhere(
      (item) => item.produk.id == produk.id,
    );

    if (index >= 0) {
      final itemLama = daftarBaru[index];

      if (itemLama.jumlah > 1) {
        daftarBaru[index] = itemLama.copyWith(
          jumlah: itemLama.jumlah - 1,
        );
      } else {
        daftarBaru.removeAt(index);
      }
    }

    emit(daftarBaru);
  }

  void kosongkan() {
    emit([]);
  }
}
