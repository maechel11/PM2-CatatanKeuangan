import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 251, 218),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 255, 251, 218),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        shadowColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                      controller.username.isEmpty
                          ? 'Loading...'
                          : controller.username.value,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                Text(
                  'CekSAKU',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow.shade100,
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle button press here
                  },
                  icon: Icon(Icons.filter_list, color: Colors.black),
                  label: Text(
                    "Pilih Bulan",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.0),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: controller.StreamData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("Belum ada transaksi"));
                    }

                    final transactions = snapshot.data!.docs;

                    // Hitung total pemasukan dan pengeluaran
                    double totalPemasukan = 0;
                    double totalPengeluaran = 0;

                    for (var transaction in transactions) {
                      if (transaction['nominal'] is num &&
                          transaction['jenis'] is String) {
                        if (transaction['jenis'] == 'pemasukan') {
                          totalPemasukan += transaction['nominal'];
                        } else if (transaction['jenis'] == 'pengeluaran') {
                          totalPengeluaran += transaction['nominal'];
                        }
                      } else {
                        print("");
                      }
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                transactions.length + 1, // Include add button
                            itemBuilder: (context, index) {
                              if (index == transactions.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        // Handle add button press
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      backgroundColor: Colors.orange,
                                    ),
                                  ),
                                );
                              } else {
                                final transaction = transactions[index];
                                final nominal = transaction['nominal'];
                                final catatan = transaction['catatan'];
                                final jenis = transaction['jenis'];
                                final tanggal =
                                    (transaction['tanggal'] as Timestamp)
                                        .toDate();

                                return TransactionCard(
                                  nominal: nominal.toString(),
                                  catatan: catatan,
                                  tanggal: tanggal,
                                  jenis: jenis,
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.black),
                              Text('Total',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Pengeluaran:'),
                                  Text(
                                      'Rp. ${totalPengeluaran.toStringAsFixed(0)}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Pemasukan:'),
                                  Text(
                                      'Rp. ${totalPemasukan.toStringAsFixed(0)}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String nominal;
  final String catatan;
  final DateTime tanggal;
  final String jenis;

  const TransactionCard({
    Key? key,
    required this.nominal,
    required this.catatan,
    required this.tanggal,
    required this.jenis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.yellow.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rp.$nominal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              catatan,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${tanggal.day}-${tanggal.month}-${tanggal.year}',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: jenis == 'Pemasukan' ? Colors.orange : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    jenis,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
