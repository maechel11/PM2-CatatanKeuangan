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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller.cCatatan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Catatan"),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return DropdownButtonFormField<String>(
                value: controller.selectedJenis.value.isEmpty
                    ? null
                    : controller.selectedJenis.value,
                onChanged: (value) {
                  controller.selectedJenis.value = value ?? '';
                },
                decoration: const InputDecoration(
                  labelText: "Jenis",
                ),
                items: const [
                  DropdownMenuItem(
                    value: "pemasukan",
                    child: Text("Pemasukan"),
                  ),
                  DropdownMenuItem(
                    value: "pengeluaran",
                    child: Text("Pengeluaran"),
                  ),
                ],
              );
            }),
            const SizedBox(height: 10),
            TextField(
              controller: controller.cNominal,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Nominal (angka)"),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return TextField(
                readOnly: true,
                controller: TextEditingController(
                  text: controller.selectedTanggal.value,
                ),
                decoration: const InputDecoration(
                  labelText: "Tanggal (YYYY-MM-DD)",
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    controller.selectedTanggal.value =
                        pickedDate.toIso8601String().split('T')[0];
                  }
                },
              );
            }),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final nominal = double.tryParse(controller.cNominal.text);
                final tanggal = DateTime.tryParse(controller.selectedTanggal.value);

                if (controller.selectedJenis.value.isEmpty ||
                    nominal == null ||
                    tanggal == null) {
                  Get.snackbar(
                    "Input tidak valid",
                    "Pastikan semua field terisi dengan benar.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                controller.add(
                  controller.cCatatan.text,
                  controller.selectedJenis.value,
                  nominal,
                  Timestamp.fromDate(tanggal),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
