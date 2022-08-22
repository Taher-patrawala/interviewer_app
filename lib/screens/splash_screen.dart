import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/screens/interviewer_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InterviewerSelection()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          scale: 1.06,
        ),
      ),
    );
  }
}
