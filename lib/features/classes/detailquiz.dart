import 'package:flutter/material.dart';

class DetailQuizPage extends StatefulWidget {
  const DetailQuizPage({super.key});

  @override
  State<DetailQuizPage> createState() => _DetailQuizPageState();
}

class _DetailQuizPageState extends State<DetailQuizPage> {
  int selectedIndex = 0;

  final List<String> options = [
    "Jenis Kelamin",
    "Alamat",
    "Hobby",
    "Riwayat Pendidikan",
    "Umur",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB34B4B),
        elevation: 0,
        title: const Text("Quiz Review 1"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 6),
                Text("15 : 00"),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // indikator nomor soal
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: List.generate(15, (index) {
                final isActive = index == 0;
                return CircleAvatar(
                  radius: 14,
                  backgroundColor: isActive ? Colors.green : Colors.white,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontSize: 12,
                      color: isActive ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // nomor soal
            const Text(
              "Soal Nomor 1 / 15",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // pertanyaan
            const Text(
              "Radio button dapat digunakan untuk menentukan ?",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 25),

            // pilihan jawaban
            ...List.generate(options.length, (index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF06565) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Text(
                    "${String.fromCharCode(65 + index)}.  ${options[index]}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            // tombol selanjutnya
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizDua()),
                  );
                },
                child: const Text("Soal Selanjutnya"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizDua extends StatefulWidget {
  const QuizDua({super.key});

  @override
  State<QuizDua> createState() => _QuizDuaState();
}

class _QuizDuaState extends State<QuizDua> {
  int selectedOption = 2; // contoh jawaban terpilih (C)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: const Color(0xFFB64A4A),
        elevation: 0,
        title: const Text("Quiz Review 1", style: TextStyle(fontSize: 16)),
        actions: [
          Row(
            children: const [
              Icon(Icons.access_time, size: 18),
              SizedBox(width: 5),
              Text("15 : 00"),
              SizedBox(width: 15),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== NOMOR SOAL =====
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(15, (index) {
                bool active = index == 1;
                return CircleAvatar(
                  radius: 13,
                  backgroundColor: active ? Colors.green : Colors.transparent,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontSize: 11,
                      color: active ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // ===== JUDUL SOAL =====
            const Text(
              "Soal Nomor 2 / 15",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // ===== PERTANYAAN =====
            const Text(
              "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            // ===== PILIHAN JAWABAN =====
            _optionItem("A", "Intergrasi", 0),
            _optionItem("B", "Standarisasi", 1),
            _optionItem("C", "Konsistensi", 2),
            _optionItem("D", "Koefensi", 3),
            _optionItem("E", "Koreksi", 4),

            const Spacer(),

            // ===== TOMBOL NAVIGASI =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Soal Sebelumnya"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Soal Selanjutnya"),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ===== WIDGET PILIHAN =====
  Widget _optionItem(String label, String text, int index) {
    bool isSelected = selectedOption == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEF6C6C) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              "$label.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
