import 'package:flutter/material.dart';

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // Language Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageOption(
                label: 'ID',
                isSelected: isIndonesian,
                onTap: () => setState(() => isIndonesian = true),
              ),
              const SizedBox(width: 40),
              _buildLanguageOption(
                label: 'EN',
                isSelected: !isIndonesian,
                onTap: () => setState(() => isIndonesian = false),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isIndonesian
                        ? 'Akses hanya untuk Dosen dan Mahasiswa Telkom University.'
                        : 'Access restricted only for Lecturer and Student of Telkom University',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),

                  Text(
                    isIndonesian
                        ? 'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :'
                        : 'Login only using your Microsoft Office 365 Account by following these format :',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  _buildBulletPoint(
                    isIndonesian
                        ? 'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"'
                        : 'Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"',
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint(
                    isIndonesian
                        ? 'Password (Akun iGracias) pada kolom Password.'
                        : 'Password (SSO / iGracias Account) on Password Field.',
                  ),

                  const SizedBox(height: 24),

                  Text(
                    isIndonesian
                        ? 'Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi "Strong Password". Pastikan Anda telah melakukan perubahan Password di iGracias.'
                        : 'Failure upon Authentication could be possibly you have not yet change your password into "Strong Password". Make sure to change your Password only in iGracias.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    isIndonesian
                        ? 'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :'
                        : 'For further Information, please contact CeLOE Service Helpdesk :',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SelectableText(
                    'Mail : infoceloe@telkomuniversity.ac.id',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    'Whatsapp : +62 821-1666-3563',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 25,
            // Simple flag placeholder using generic colors or just code
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: label == 'ID'
                ? Column(
                    children: [
                      Expanded(child: Container(color: Colors.red)),
                      Expanded(child: Container(color: Colors.white)),
                    ],
                  )
                : Column(
                    children: [
                      // Very simplified Union Jack approximation or just text
                      Expanded(child: Container(color: Colors.blue[900])),
                      Expanded(child: Container(color: Colors.white)),
                      Expanded(child: Container(color: Colors.red[900])),
                    ],
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected) Container(width: 20, height: 2, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }
}
