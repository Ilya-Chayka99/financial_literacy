
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financial_literacy/Screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: Column(
            children: [
              LottieBuilder.asset("lib/Assets/AnimJson/Animation - 1713702796003.json"),
             
            ],
          ),
        ), 
        nextScreen: const MyHomePage(),
        splashIconSize: 500,
        backgroundColor: Colors.white,
      ),
    );
  }
}