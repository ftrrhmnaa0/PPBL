
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/favorit_cubit.dart';

class KartuLayanan extends StatelessWidget {
  final String nama;
  final String deskripsi;
  final VoidCallback onTap;

  const KartuLayanan({
    super.key,
    required this.nama,
    required this.deskripsi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        title: Text(nama),
        subtitle: Text(deskripsi),
        onTap: onTap,
        trailing: BlocBuilder<FavoritCubit, Set<String>>(
          builder: (context, daftarFavorit) {
            final isFavorit = daftarFavorit.contains(nama);

            return IconButton(
              icon: Icon(
                isFavorit ? Icons.star : Icons.star_border,
                color: isFavorit ? warna.primary : warna.onSurface,
              ),
              onPressed: () {
                if (isFavorit) {
                  context.read<FavoritCubit>().batalTandai(nama);
                } else {
                  context.read<FavoritCubit>().tandai(nama);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
