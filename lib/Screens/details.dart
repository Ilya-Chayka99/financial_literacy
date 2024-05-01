

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeteilsScreens extends StatefulWidget {
  const DeteilsScreens({super.key});

  @override
  State<DeteilsScreens> createState() => _DeteilsScreensState();
}

class _DeteilsScreensState extends State<DeteilsScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient:LinearGradient(
                  colors: [Color(0xff17203a), Color(0xff1e2962)],
                  stops: [0.25, 0.75],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_back, color: Colors.white,),
                          onPressed: () => Get.back(),
                        ),
                        Flexible(
                          child: Text("category.name",style: GoogleFonts.russoOne(
                            textStyle: const TextStyle(color: Colors.white, fontSize: 16)
                          ),textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}