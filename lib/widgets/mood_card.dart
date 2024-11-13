import 'package:mental_health_tracker/screens/list_moodentry.dart';
import 'package:mental_health_tracker/screens/moodentry_form.dart';
import 'package:flutter/material.dart';

// Definisi ItemHomepage
class ItemHomepage {
  final String name; // Nama tombol
  final IconData icon; // Ikon tombol

  ItemHomepage(this.name, this.icon); // Konstruktor
}

// Definisi ItemCard
class ItemCard extends StatelessWidget {
  final ItemHomepage item; // ItemHomepage yang akan ditampilkan

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Mood") {
            // Menggunakan Navigator.push untuk menavigasi ke halaman MoodEntryFormPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoodEntryFormPage(),
              ),
            );
          } else if (item.name == "Lihat Mood") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MoodEntryPage()));
          } else if (item.name == "Logout") {
            // Implementasi untuk logout
            // Logika logout bisa ditambahkan di sini
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 40.0), // Menampilkan ikon
              const SizedBox(height: 8.0),
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
