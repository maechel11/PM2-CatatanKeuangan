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
        backgroundColor: const Color.fromARGB(255, 255, 251, 218),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        shadowColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 251, 218), // Warna latar belakang
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Column(
            children: [
              TextField(
                controller: controller.cCatatan,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Catatan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
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
                  decoration: InputDecoration(
                    labelText: "Jenis",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
                decoration: InputDecoration(
                  labelText: "Nominal (angka)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Text(
                      controller.selectedTanggal.value.isEmpty
                          ? "Pilih tanggal"
                          : controller.selectedTanggal.value,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: controller.selectedTanggal.value.isEmpty
                            ? const Color.fromARGB(255, 9, 9, 9)
                            : Colors.black,
                      ),
                    );
                  }),
                  const SizedBox(
                      width: 1), // Memberi jarak antara teks dan ikon
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
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
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Warna tombol konfirmasi
                ),
                onPressed: () {
                  final nominal = double.tryParse(controller.cNominal.text);
                  final tanggal =
                      DateTime.tryParse(controller.selectedTanggal.value);

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
      ),
    );
  }
}
