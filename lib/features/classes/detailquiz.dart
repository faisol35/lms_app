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
                onPressed: () {},
                child: const Text("Soal Selanjutnya"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
