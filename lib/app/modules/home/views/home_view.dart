import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  

  final cAuth = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
              onPressed: () {
                cAuth.logout();
              },
              // child: const Text('My Button'),
              child: const Icon(Icons.logout),
            ), 
          ),
      
    );
  }
}
