import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/widgets/custom_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Header Stack
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Red Background
                Container(
                  width: double.infinity,
                  height: 280,
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => context.pop(),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Avatar
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/profile_placeholder.png',
                            ), // Need placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Fallback icon if image fails
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Moh. Faisol Ansori',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40), // Space for Tabs
                    ],
                  ),
                ),
                // Floating Tab Bar
                Positioned(
                  bottom: -25,
                  left: 24,
                  right: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.grey[600],
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      tabs: const [
                        Tab(text: 'About Me'),
                        Tab(text: 'Kelas'),
                        Tab(text: 'Edit Profile'),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Tab View Content
            const Expanded(
              child: TabBarView(
                children: [
                  _AboutMeView(),
                  _ProfileClassesView(),
                  _EditProfileView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutMeView extends StatelessWidget {
  const _AboutMeView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Text(
          'Informasi User',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        _buildInfoItem('Email address', 'mohfaisolansori@uim.ac.id'),
        _buildInfoItem('Program Studi', 'S1 Teknik Informatika'),
        _buildInfoItem('Fakultas', 'Teknik'),

        const SizedBox(height: 32),

        const Text(
          'Aktivitas Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          'First access to site',
          'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
        ),
        _buildInfoItem(
          'Last access to site',
          'Tuesday, 22 June 2021, 9:44 PM (now)',
        ),

        const SizedBox(height: 40),

        // Log Out Button
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC62828), // Dark Red
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(PhosphorIcons.signOut(), color: Colors.white),
            label: const Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _ProfileClassesView extends StatelessWidget {
  const _ProfileClassesView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: const [
        _ClassItem(
          title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO], JUMAT 2',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title: 'OLAH RAGA D3TT-44-02 [EYR]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title:
              'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _ClassItem(
          title: 'SISTEM OPERASI D4SM-44-02 [DDS]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
      ],
    );
  }
}

class _ClassItem extends StatelessWidget {
  final String title;
  final String date;

  const _ClassItem({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[300], // Muted Blue
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileView extends StatelessWidget {
  const _EditProfileView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        const CustomTextField(label: 'Nama Pertama'),
        const SizedBox(height: 16),
        const CustomTextField(label: 'Nama Terakhir'),
        const SizedBox(height: 16),
        const CustomTextField(label: 'E-mail Address'),
        const SizedBox(height: 16),
        const CustomTextField(label: 'Negara'),
        const SizedBox(height: 16),
        // Description Area
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              foregroundColor: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Simpan'),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
