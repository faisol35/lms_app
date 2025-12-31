import 'package:flutter/material.dart';

class DetailQuizPage extends StatefulWidget {
  const DetailQuizPage({super.key});

  @override
  State<DetailQuizPage> createState() => _DetailQuizPageState();
}

class _DetailQuizPageState extends State<DetailQuizPage> {
  int currentQuestion = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Radio button dapat digunakan untuk menentukan ?",
      "options": [
        "Jenis Kelamin",
        "Alamat",
        "Hobby",
        "Riwayat Pendidikan",
        "Umur",
      ],
      "selected": 0,
    },
    {
      "question":
          "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      "options": [
        "Intergrasi",
        "Standarisasi",
        "Konsistensi",
        "Koefensi",
        "Koreksi",
      ],
      "selected": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFB34B4B),
        elevation: 0,
        title: const Text("Quiz Review 1"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 5),
                Text("15 : 00"),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNumberIndicator(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Soal Nomor ${currentQuestion + 1} / ${questions.length}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              question["question"],
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: question["options"].length,
              itemBuilder: (context, index) {
                final isSelected = question["selected"] == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      question["selected"] = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFF06565)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Text(
                      "${String.fromCharCode(65 + index)}. ${question["options"][index]}",
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildNavigationButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildNumberIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        children: List.generate(questions.length, (index) {
          final isActive = index == currentQuestion;
          return CircleAvatar(
            radius: 14,
            backgroundColor: isActive ? Colors.green : Colors.grey.shade300,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 12,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavigationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentQuestion > 0)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                setState(() {
                  currentQuestion--;
                });
              },
              child: const Text("Soal Sebelumnya"),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              if (currentQuestion < questions.length - 1) {
                setState(() {
                  currentQuestion++;
                });
              }
            },
            child: const Text("Soal Selanjutnya"),
          ),
        ],
      ),
    );
  }
}
