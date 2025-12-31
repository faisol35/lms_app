import 'package:flutter/material.dart';
import 'detailquiz.dart';

class Quizreview extends StatelessWidget {
  const Quizreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB34B4B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Deskripsi =====
            const Text(
              'Silahkan kerjakan kuis ini dalam waktu 15 menit '
              'sebagai nilai pertama komponen kuis.\n\n'
              'Jangan lupa klik tombol Submit Answer setelah menjawab '
              'seluruh pertanyaan.\n\n'
              'Kerjakan sebelum hari Jumat, 26 Februari 2021 jam 23:59 WIB.',
              style: TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 16),

            // ===== Info Kuis =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Text(
                    'Kuis Akan di tutup pada Jumat, 26 Februari 2021, 11:59 PM',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text('Batas Waktu: 15 menit', style: TextStyle(fontSize: 12)),
                  SizedBox(height: 6),
                  Text(
                    'Metode Penilaian: Nilai Tertinggi',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Percobaan =====
            const Text(
              'Percobaan Yang Sudah Di Lakukan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // ===== Header Status =====
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Status',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'Nilai / 100.00',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'Tinjau kembali',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ===== Detail Percobaan =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Selesai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
                const Text(
                  '85,0',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text('Lihat')),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
              style: TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 30),

            // ===== Button =====
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailQuizPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Ambil Kuis'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Kembali Ke Kelas'),
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
