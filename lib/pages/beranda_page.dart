
import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Selamat Datang di AgriClima LSTM',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            const Text(
              'Aplikasi pencatatan hasil prediksi mikroklimat '
              'tanaman untuk membantu petugas memantau kondisi '
              'lahan dan menentukan perawatan tanaman.',
            ),
            const SizedBox(height: 24),
            Card(
              color: scheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Model',
                      style: Theme.of(context)
                          .textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    const ListTile(
                      leading: Icon(Icons.memory),
                      title: Text('Model Deep Learning'),
                      subtitle: Text('Long Short-Term Memory (LSTM)'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text('Waktu Prediksi'),
                      subtitle: Text('24 jam ke depan'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.analytics_outlined),
                      title: Text('Parameter Mikroklimat'),
                      subtitle: Text('3 parameter'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.tentang,
                  );
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('Tentang Aplikasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
