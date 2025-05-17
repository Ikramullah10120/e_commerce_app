import 'dart:async';
import 'package:e_commerce_app/screens/homscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToHome();
    });
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const Homscreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Optional: Light background
      body: Stack(
        children: [
          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fancy logo or splash image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/splashimage.jpg',
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // Bottom CircularProgressIndicator
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
