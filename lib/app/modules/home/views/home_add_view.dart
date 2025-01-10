import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/home_controller.dart';

class HomeAddView extends GetView<HomeController> {
  const HomeAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah catatan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cCatatan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Catatan"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cJenis,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Jenis (Pemasukan / Pengeluaran)",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cNominal,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nominal (angka)"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.cTanggal,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Tanggal (YYYY-MM-DD)"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final nominal = double.tryParse(controller.cNominal.text);
                final tanggal = DateTime.tryParse(controller.cTanggal.text);

                if (nominal == null || tanggal == null) {
                  Get.snackbar(
                    "Input tidak valid",
                    "Pastikan nominal adalah angka dan tanggal memiliki format yang benar (YYYY-MM-DD).",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                controller.add(
                  controller.cCatatan.text,
                  controller.cJenis.text,
                  nominal,
                  Timestamp.fromDate(tanggal),
                );
              },
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
