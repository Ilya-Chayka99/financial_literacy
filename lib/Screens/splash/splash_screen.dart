
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Models/user.dart';
import 'package:financial_literacy/Repositories/repository.dart';
import 'package:financial_literacy/Screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
   check() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("login") == true) {
      User? user = await Repository.loginUser(prefs.getString("email")!,prefs.getString("pass")!);
      ControllerGet.to.user.value = user!;
      Future.delayed(const Duration(milliseconds: 1500),
        () async {
           Get.offAllNamed("/main");                   
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ControllerGet.init();
    check();
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: Column(
            children: [
              LottieBuilder.asset("lib/Assets/AnimJson/Animation - 1713702796003.json"),
             
            ],
          ),
        ), 
        nextScreen: const Onboarding(),
        splashIconSize: 500,
        backgroundColor: Colors.white,
      ),
    );
  }
}