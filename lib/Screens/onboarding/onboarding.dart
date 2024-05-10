
import 'package:financial_literacy/Components/sign_in_form.dart';
import 'package:financial_literacy/Components/sign_up_form.dart';
import 'package:financial_literacy/Models/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.items[index].image),
                    Text(controller.items[index].title,style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Color.fromARGB(192, 0, 0, 0),fontSize: 32)
                    ),textAlign: TextAlign.center),
                    Text(controller.items[index].decoration,style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Color.fromARGB(115, 0, 0, 0),fontSize: 16)
                    ),textAlign: TextAlign.center,),
                  ],
                ),
              ),
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
          customSignInDialog(context);
          //Get.offAllNamed("/main");
        }, 
        child: const Text("Начать")
      ),
    );
  }

}

Future<Object?> customSignInDialog(BuildContext context) {
  return showGeneralDialog(
    context: context, 
    barrierDismissible: true,
    barrierLabel: "Авторизация",
    pageBuilder: (context,_ ,__) => Center(
      child: Container(
        height: 663,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(Radius.circular(40))
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Text("Авторизация",style: GoogleFonts.russoOne(
                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 34)
                ),),
                const SizedBox(height: 10,),
                const SignInForm(),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("ИЛИ",style: GoogleFonts.russoOne(
                          textStyle: const TextStyle(color: Colors.black26,)
                        ),),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text("Зарегистрируйтесь с помощью Электронной почты, Apple или Google",style: GoogleFonts.russoOne(
                          textStyle: const TextStyle(color: Colors.black54, )
                        ),
                        textAlign: TextAlign.center,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        customSignUpDialog(context);
                      }, 
                      icon: SvgPicture.asset("lib/Assets/icons/email_box.svg", height: 64,width: 64,),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: SvgPicture.asset("lib/Assets/icons/google_box.svg", height: 64,width: 64,),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: SvgPicture.asset("lib/Assets/icons/apple_box.svg", height: 64,width: 64,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )
  );
}

Future<Object?> customSignUpDialog(BuildContext context) {
  return showGeneralDialog(
    context: context, 
    barrierDismissible: true,
    barrierLabel: "Регистрация",
    pageBuilder: (context,_ ,__) => Center(
      child: Container(
        height: 711,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(Radius.circular(40))
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Column(
                children: [
                  Text("Регистрация",style: GoogleFonts.russoOne(
                    textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 34)
                  ),),
                  const SizedBox(height: 10,),
                  const SignUpForm(),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom/1.5))
                ],
              ),
            ),
          ),
        ),
      ),
    )
  );
}