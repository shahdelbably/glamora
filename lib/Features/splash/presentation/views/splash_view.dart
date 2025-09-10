// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';
import 'package:store_powered_ai/Features/onBoardings/presentation/views/on_boardinds.dart';
import 'package:store_powered_ai/Features/splash/presentation/views/widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // void _navigateToNextScreen() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const OnboardingView()), // Ensure OnboardingView is correctly used
  //     );
  //   });
  // }
  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavView()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
