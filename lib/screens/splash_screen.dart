import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goodfilms/widgets/bottom_nav_bar.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4600), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 40, 48),
      body: Center(
        child: Lottie.asset(
          'assets/fullLogo.json',
          width: 300,
        ),
      ),
    );
  }
}
