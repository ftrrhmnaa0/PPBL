import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Widget kartuPilar(
    String nama,
    String deskripsi,
    IconData ikon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          ikon,
          size: 35,
          color: Colors.teal,
        ),
        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(deskripsi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              Icon(
                Icons.location_city,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                'KOTA NUSANTARA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Cerdas, Terhubung, dan Berkelanjutan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'Enam Pilar Smart City',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        kartuPilar(
          'Smart Governance',
          'Pemerintahan yang efektif dan pelayanan publik digital.',
          Icons.account_balance,
        ),

        kartuPilar(
          'Smart Economy',
          'Pengembangan ekonomi melalui pemanfaatan teknologi.',
          Icons.trending_up,
        ),

        kartuPilar(
          'Smart Living',
          'Peningkatan kualitas hidup dan kesejahteraan warga.',
          Icons.health_and_safety,
        ),

        kartuPilar(
          'Smart Mobility',
          'Transportasi yang terintegrasi dan efisien.',
          Icons.directions_bus,
        ),

        kartuPilar(
          'Smart Environment',
          'Pengelolaan lingkungan yang bersih dan berkelanjutan.',
          Icons.eco,
        ),

        kartuPilar(
          'Smart People',
          'Masyarakat yang cerdas dan mampu memanfaatkan teknologi.',
          Icons.people,
        ),
      ],
    );
  }
}