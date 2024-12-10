import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                filled: true, 
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              controller: controller.cUsername,
              decoration: InputDecoration(
                filled: true, 
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Obx(
              () => TextField(
              controller: controller.cPassword,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                  filled: true, 
                  fillColor: Colors.white,
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
            ),),
            const SizedBox(height: 20),
            Text(
              'Konfirmasi Password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Obx(
              () => TextField(
                controller: controller.cConfirmPassword,
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Konfirmasi Password",
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (controller.cPassword.text !=
                    controller.cConfirmPassword.text) {
                  Get.snackbar(
                    'Error',
                    'Password dan Konfirmasi Password tidak sama',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                  return;
                }
                cAuth.register(
                  controller.cEmail.text,
                  controller.cPassword.text,
                  username: controller.cUsername.text,
                );
              },
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
