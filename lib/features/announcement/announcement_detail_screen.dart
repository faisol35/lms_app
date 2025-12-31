import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/banner_maintenance.png', // Assuming reuse of existing asset or need to place one
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.blue[50],
                    child: Center(
                      child: Icon(Icons.image, color: Colors.blue[200]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Maintenance LMS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).\n\n'
              'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.\n\n'
              'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.\n\n'
              'Hormat Kami,\n'
              'CeLOE Telkom University',
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
