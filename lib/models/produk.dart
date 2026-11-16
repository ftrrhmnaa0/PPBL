
class Produk {
  final String nama;
  final int harga;
  final String ikon;

  const Produk({
    required this.nama,
    required this.harga,
    required this.ikon,
  });
}

class ItemKeranjang {
  final Produk produk;
  final int jumlah;

  const ItemKeranjang({
    required this.produk,
    required this.jumlah,
  });

  ItemKeranjang copyWith({
    Produk? produk,
    int? jumlah,
  }) {
    return ItemKeranjang(
      produk: produk ?? this.produk,
      jumlah: jumlah ?? this.jumlah,
    );
  }
}
