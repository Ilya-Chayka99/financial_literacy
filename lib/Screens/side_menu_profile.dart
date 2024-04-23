
import 'package:financial_literacy/Components/info_card.dart';
import 'package:financial_literacy/Components/sign_in_form.dart';
import 'package:financial_literacy/Components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenuProfile extends StatelessWidget {
  const SideMenuProfile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      color: Colors.green,
      child:  SafeArea(
        child: Column(
          children: [
            const InfoCard(name: "wiwiwi", email: "Info@eee.ru",),
            SizedBox(
              height: 600,
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context,i)=> ListTile(
                  title: const Text("zzzz"),
                  trailing: const Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 255, 255, 255),),
                  onTap: () {
                    customSignInDialog(context);
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
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
                                Text("Регистрация",style: GoogleFonts.russoOne(
                                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 34)
                                ),),
                                const SizedBox(height: 10,),
                                const SignUpForm(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  );
  }
}

