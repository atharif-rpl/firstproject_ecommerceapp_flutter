
import 'package:flutter/material.dart';

import '../onboarding/on_boarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => FirstOnBoarding()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logomamu.png')),
    );
  }
}