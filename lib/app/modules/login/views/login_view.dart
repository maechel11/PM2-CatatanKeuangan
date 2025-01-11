import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 237, 148, 85),
              Color.fromARGB(255, 255, 251, 218),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Image.asset(
                  "assets/logo.jpeg",
                  height: 150,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: controller.cEmail,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Masukkan Email",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Obx(
                        () => TextField(
                          controller: controller.cPassword,
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Masukkan Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                controller.isPasswordHidden.toggle();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            "Lupa Password?",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.RESET_PASSWORD);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            cAuth.login(
                              controller.cEmail.text,
                              controller.cPassword.text,
                            );
                          },
                          child: Text(
                            "MASUK",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50), // Lebar penuh dan tinggi tombol
                            backgroundColor: Color.fromARGB(255, 237, 148, 85),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum Punya Akun ?"),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: Text(
                              "Daftar Disini",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
