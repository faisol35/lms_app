import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'widgets/announcement_card.dart';
import 'widgets/course_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Budi', // Hello, [Name]
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Selamat Datang Kembali!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(PhosphorIcons.bell(), color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 1: Upcoming Tasks (Tugas Yang Akan Datang)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tugas Yang Akan Datang',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              PhosphorIcons.clock(),
                              size: 20,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text('Matematika Dasar - Bab 3'),
                            ),
                            Text(
                              'Besok',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Section 2: Announcements (Pengumuman Terakhir)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Pengumuman Terakhir',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                children: [
                  AnnouncementCard(
                    title: 'Jadwal Ujian Semester',
                    description:
                        'Ujian semester akan dilaksanakan mulai tanggal 15 Januari...',
                    color: Colors.blue.shade700,
                  ),
                  const AnnouncementCard(
                    title: 'Libur Nasional',
                    description:
                        'Kampus akan tutup pada tanggal 25 Desember untuk perayaan...',
                    color: Colors.teal,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section 3: Course List (Program Kelas)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Program Kelas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CourseCard(
                  title: 'Dasar Pemrograman',
                  progress: '70% Selesai',
                  progressValue: 0.7,
                  iconColor: Colors.blue,
                ),
                CourseCard(
                  title: 'Desain UI/UX',
                  progress: '45% Selesai',
                  progressValue: 0.45,
                  iconColor: Colors.purple,
                ),
                CourseCard(
                  title: 'Manajemen Bisnis',
                  progress: '20% Selesai',
                  progressValue: 0.2,
                  iconColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
