
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:financial_literacy/Components/myCustomClipper.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Stack(
        children: [
          Container(),
          ClipPath(
            clipper: MyCustioClipper(),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/Assets/image/sqare.png')
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProfileAvatar(
                  "http://89.111.131.40:8080/api/image/image/${ControllerGet.to.user.value.image}",
                  borderWidth: 4,
                ),
                Text(
                  ControllerGet.to.user.value.name,
                  style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(
                         color: Colors.white,
                         fontSize: 21
                  )),
                ),
                Text(
                  ControllerGet.to.user.value.email,
                  style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(117, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w100)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}