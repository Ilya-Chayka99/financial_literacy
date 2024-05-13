import 'package:financial_literacy/Components/stackContainer.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenuProfile extends StatelessWidget {
  const SideMenuProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff17203a), Color(0xff1e2962)],
        stops: [0.25, 0.75],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StackContainer(),
          Padding(
            padding: const EdgeInsets.only( top: 16.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 111),
              child: SizedBox(
                height: 470,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ControllerGet.to.user.value.rank.toString(),
                                style: GoogleFonts.russoOne(
                                    textStyle: const TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                              Text(
                                "Рэйтинг",
                                style: GoogleFonts.russoOne(
                                    textStyle: const TextStyle(
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.amber,
                              thickness: 3,
                            )),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  ControllerGet.to.user.value.money.toString(),
                                  style: GoogleFonts.russoOne(
                                      textStyle: const TextStyle(
                                    color: Colors.white,
                                  )),
                                ),
                               
                                SvgPicture.asset(
                                  "lib/Assets/icons/rate-diamond-svgrepo-com.svg",
                                  width: 25,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: ()  {
                            customShopDialog(context);
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(
                                    "lib/Assets/icons/rate-diamond-svgrepo-com.svg",
                                    width: 25,
                                  ),
                                  Text("Магазин",
                                      style: GoogleFonts.russoOne(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                      )),textAlign: TextAlign.center,
                                    ),
                                  SvgPicture.asset(
                                    "lib/Assets/icons/rate-diamond-svgrepo-com.svg",
                                    width: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool("login", false);
                            Get.off(const Onboarding());
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Выход",
                                      style: GoogleFonts.russoOne(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                      )),textAlign: TextAlign.center,
                                    ),
                                    const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}


Future<Object?> customShopDialog(BuildContext context) {
  return showGeneralDialog(
    context: context, 
    barrierDismissible: true,
    barrierLabel: "Магазин",
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
                Text("Магазин",style: GoogleFonts.russoOne(
                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 34)
                ),),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Expanded(child: Divider()),
                  ],
                ),
                

              ],
            ),
          ),
        ),
      ),
    )
  );
}