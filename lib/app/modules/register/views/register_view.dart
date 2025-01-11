import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
            AppBar(
              title: const Text(
                'DAFTAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            Expanded(
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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildInputField(
                        label: 'Email',
                        controller: controller.cEmail,
                        hint: 'Masukkan Email',
                      ),
                      const SizedBox(height: 20),
                      _buildInputField(
                        label: 'Username',
                        controller: controller.cUsername,
                        hint: 'Masukkan Username',
                      ),
                      const SizedBox(height: 20),
                      Obx(() => _buildPasswordField(
                            label: 'Password',
                            controller: controller.cPassword,
                            isHidden: controller.isPasswordHidden.value,
                            toggleVisibility: () => controller.isPasswordHidden.toggle(),
                          )),
                      const SizedBox(height: 20),
                      Obx(() => _buildPasswordField(
                            label: 'Konfirmasi Password',
                            controller: controller.cConfirmPassword,
                            isHidden: controller.isPasswordHidden.value,
                            toggleVisibility: () => controller.isPasswordHidden.toggle(),
                          )),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.cPassword.text != controller.cConfirmPassword.text) {
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
                          child: const Text(
                            'DAFTAR',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Color.fromARGB(255, 237, 148, 85),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: hint,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isHidden,
    required VoidCallback toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isHidden,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Masukkan $label",
            suffixIcon: IconButton(
              icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
              onPressed: toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
