
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
                      textStyle: const TextStyle(color: Colors.black,)
                    ),),
        Text(email,style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Color.fromARGB(75, 0, 0, 0),fontWeight: FontWeight.w100)
                    ),),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("33 %"),
                  Text("Пройдено",textAlign: TextAlign.center,),
                ],
              ),
              const SizedBox(
                height: 60,
                child: VerticalDivider(color: Colors.amber,thickness: 3,)
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("------"),
                  Text("Рейтинг"),
                ],
              ),
              const SizedBox(
                height: 60,
                child: VerticalDivider(color: Colors.amber,thickness: 3,)
              ),
              Center(
                child: Row(
                  children: [
                    Text("14345"),
                    SizedBox(width: 5,),
                    SvgPicture.asset("lib/Assets/icons/rate-diamond-svgrepo-com.svg",width: 25,),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 24 , right: 5),
                child: SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                    
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF77D8E),
                      minimumSize: const Size(20, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(10)
                        )
                      )
                    ),
                    child: Text("Редактировать профиль",textAlign: TextAlign.center,style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Colors.white,fontSize: 10)
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 24),
                child: SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                    
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF77D8E),
                      minimumSize: const Size(20, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(25)
                        )
                      )
                    ),
                    
                    child: Text("Редактировать профиль",textAlign: TextAlign.center,style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Colors.white,fontSize: 10)
                    ),),
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}