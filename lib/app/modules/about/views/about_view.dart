import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 148, 85),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'di ${controller.appName}, solusi pintar untuk mengelola keuangan keluarga Anda dengan lebih mudah dan efisien. Kami hadir untuk membantu setiap keluarga merencanakan dan mengontrol pengeluaran serta tabungan, memberikan cara yang lebih baik dalam mencatat dan memantau keuangan keluarga tanpa kerumitan.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              Text(
                'Kami percaya bahwa keuangan yang sehat adalah kunci kesejahteraan keluarga. Dengan fitur yang user-friendly dan desain yang intuitif, aplikasi ini dirancang untuk membantu Anda dan keluarga membuat keputusan finansial yang lebih cerdas, serta mempersiapkan masa depan yang lebih stabil.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 30),
              Text(
                'Visi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Menjadi aplikasi pencatatan keuangan keluarga terbaik yang membantu setiap keluarga merencanakan dan mengelola keuangan dengan mudah dan efektif.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 30),
              Text(
                'Misi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Memberikan alat pencatatan keuangan yang mudah digunakan dan dapat diakses oleh seluruh anggota keluarga.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 5),
              const Text(
                '• Menyediakan fitur yang memungkinkan pengguna untuk melacak pengeluaran, membuat anggaran, dan merencanakan tabungan jangka panjang.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 5),
              const Text(
                '• Membangun kesadaran keuangan dalam keluarga, agar setiap keputusan finansial lebih bijak dan terencana.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
