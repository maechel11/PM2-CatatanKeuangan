import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bantuan_controller.dart';

class BantuanView extends GetView<BantuanController> {
  const BantuanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian judul header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bantuan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Temukan jawaban untuk pertanyaan Anda di sini.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Daftar menu bantuan
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.question_answer, color: Colors.orange),
                    title:
                        const Text('Bagaimana cara menggunakan aplikasi ini?'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/cara-menggunakan');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.orange),
                    title:
                        const Text('Bagaimana cara mengatur ulang kata sandi?'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/atur-ulang-kata-sandi');
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.contact_support, color: Colors.orange),
                    title: const Text('Hubungi layanan pelanggan'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.toNamed('/hubungi-layanan');
                    },
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
