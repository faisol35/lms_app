import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AnnouncementListScreen extends StatelessWidget {
  const AnnouncementListScreen({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildItem(
            context,
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            date: 'Rabu, 2 Juni 2021, 10:45',
            onTap: () => context.push('/announcements/detail'),
          ),
          _buildItem(
            context,
            title: 'Pengumuman Maintance',
            date: 'Senin, 11 Januari 2021, 7:52',
            onTap: () => context.push('/announcements/detail'),
          ),
          _buildItem(
            context,
            title: 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
            date: 'Minggu, 10 Januari 2021, 9:30',
            onTap: () => context.push('/announcements/detail'),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String title,
    required String date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              PhosphorIcons.megaphone(PhosphorIconsStyle.fill),
              size: 28,
              color: Colors.black,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'By Admin Celoe - $date',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
