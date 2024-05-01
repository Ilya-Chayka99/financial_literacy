
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, required this.name, required this.email, required this.img,
  });

  final String name,email,img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(img),
        ),
        Text(name,style: GoogleFonts.russoOne(
          textStyle: const TextStyle(color: Colors.white,)
        ),),
        Text(email,style: GoogleFonts.russoOne(
          textStyle: const TextStyle(color: Color.fromARGB(117, 255, 255, 255),fontWeight: FontWeight.w100)
        ),),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("33 %",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),)
                  ),),
                  Text("Пройдено",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Colors.white,)
                  ),),
                ],
              ),
              const SizedBox(
                height: 60,
                child: VerticalDivider(color: Colors.amber,thickness: 3,)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("--------",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Colors.white,)
                  ),),
                  Text("Рэйтинг",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Colors.white,)
                  ),),
                ],
              ),
              const SizedBox(
                height: 60,
                child: VerticalDivider(color: Colors.amber,thickness: 3,)
              ),
              Center(
                child: Column(
                  children: [
                    Text("30",style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Colors.white,)
                    ),),
                    SizedBox(width: 70,height: 5,),
                    SvgPicture.asset("lib/Assets/icons/rate-diamond-svgrepo-com.svg",width: 25,),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 24 , right: 5),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size(20, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    )
                  )
                ),
                child: Text("Редактировать профиль",textAlign: TextAlign.center,style: GoogleFonts.russoOne(
                  textStyle: const TextStyle(color: Colors.black,fontSize: 18)
                ),),
              ),
            ),
          )
      ],
    );
  }
}