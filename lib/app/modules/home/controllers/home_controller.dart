import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController cCatatan;
  late TextEditingController cJenis;
  late TextEditingController cNominal;
  late TextEditingController cTanggal;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference keuangan = firestore.collection('keuangan');
    return keuangan.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference keuangan = firestore.collection('keuangan');
    return keuangan.snapshots();
  }

  //tambah data
  void add(String catatan, String jenis, num nominal, Timestamp tanggal) async {
    CollectionReference keuangan = firestore.collection("keuangan");

    try {
      await keuangan.add({
        "catatan": catatan,
        "jenis": jenis,
        "nominal": nominal,
        "tanggal": tanggal,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan catatan",
          onConfirm: () {
            cCatatan.clear();
            cJenis.clear();
            cNominal.clear();
            cTanggal.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan dosen.",
      );
    }
  }

  // Menggunakan RxString agar bisa reaktif dan update UI ketika berubah
  var username = ''.obs; // Username reaktif

  @override
  void onInit() {
    super.onInit();
    _fetchUserData(); // Ambil data pengguna saat controller diinisialisasi
  }

  Future<void> _fetchUserData() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;

        // Ambil data dari Firestore
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (userDoc.exists) {
          // Update nilai username secara reaktif
          username.value = userDoc.get('username') ?? 'Nama tidak ditemukan';
        } else {
          print("User document tidak ditemukan.");
        }
      }
    } catch (e) {
      print("Error mengambil data pengguna: $e");
    }
  }
}
