import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  final mainColor = const Color.fromARGB(255, 237, 148, 85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Logo/Icon
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 148, 85)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    size: 60,
                    color: Color.fromARGB(255, 237, 148, 85),
                  ),
                ),
              ),

              // App Name and Version
              Center(
                child: Column(
                  children: [
                    const Text(
                      'CekSaku',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 237, 148, 85),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Versi 1.0.0',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Description Section
              const Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'CekSaku adalah aplikasi pengelolaan keuangan keluarga yang dirancang untuk membantu Anda mengatur dan memantau keuangan keluarga dengan lebih efektif. Aplikasi ini menyediakan berbagai fitur yang memudahkan pencatatan pemasukan, pengeluaran, dan perencanaan anggaran keluarga.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              const SizedBox(height: 24),

              // Features Section
              const Text(
                'Fitur Utama',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildFeatureItem(
                Icons.note_add,
                'Pencatatan Transaksi',
                'Catat pemasukan dan pengeluaran dengan mudah',
              ),
              _buildFeatureItem(
                Icons.bar_chart,
                'Laporan Keuangan',
                'Lihat laporan dan analisis keuangan keluarga',
              ),
              _buildFeatureItem(
                Icons.account_balance,
                'Anggaran',
                'Buat dan kelola anggaran keluarga',
              ),
              _buildFeatureItem(
                Icons.savings,
                'Target Menabung',
                'Tetapkan dan pantau target tabungan keluarga',
              ),

              const SizedBox(height: 24),

              // Contact Section
              const Text(
                'Hubungi Kami',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildContactItem(
                Icons.email,
                'Email',
                'support@familyfinance.com',
              ),
              _buildContactItem(
                Icons.phone,
                'Telepon',
                '+62 123 4567 890',
              ),

              // Developer Info
              const SizedBox(height: 32),
              Center(
                child: Text(
                  '© 2024 CekSaku',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 237, 148, 85).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon,
                color: const Color.fromARGB(255, 237, 148, 85), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 237, 148, 85), size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
