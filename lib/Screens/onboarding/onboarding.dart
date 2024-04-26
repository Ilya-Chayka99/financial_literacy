
import 'package:financial_literacy/Models/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: isLastPage ? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => pageController.jumpToPage(controller.items.length - 1), 
              child: const Text("Пропустить")
            ),
            SmoothPageIndicator(
              controller: pageController, 
              count: controller.items.length,
              effect: const WormEffect(
                activeDotColor: Colors.amber,
                dotHeight: 12,
                dotWidth: 12,

              ),
            ),
            TextButton(
              onPressed: () => pageController.nextPage(
                duration: const Duration(milliseconds: 500), 
                curve: Curves.easeIn
              ), 
              child: const Text("Далее")
            ),
          ],
        ) 
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) => setState(() => isLastPage = controller.items.length - 1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(controller.items[index].image,frameRate: FrameRate.max),
                Text(controller.items[index].title),
                Text(controller.items[index].decoration),
              ],
            );
          }),
      ),
    );
  }

  Widget getStarted(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
        onPressed: (){
          Get.offAllNamed("/main");
        }, 
        child: Text("Начать")
      ),
    );
  }

}