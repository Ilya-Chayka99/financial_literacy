
import 'package:carousel_slider/carousel_slider.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> content = [

     const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            AppBar1(),
            Body(),
          ],
        ),
      ),
     ),


     Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png"),
            Text("Данный раздел находится в разработке! \nПриносим свои извинения",style: GoogleFonts.russoOne(
                    textStyle: const TextStyle(color: Colors.black,fontSize: 40)
                  ), textAlign: TextAlign.center,),
          ],
        ),
      ),
     ),


      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("3"),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text('e45345'
            ),
          ],
        ),
      ),
     ),
  ];



  class AppBar1 extends StatelessWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
           const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Финансовая грамотность -\nтрэнд 21 века",style: GoogleFonts.russoOne(
                textStyle: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.06 )
              ),),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 26,
              ),
              suffixIcon: const Icon(
                Icons.mic,
                color: Colors.grey,
                size: 26,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Поиск темы",
              labelStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              isDense: true,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}


  class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Изучите категории",style: GoogleFonts.russoOne(
                textStyle: const TextStyle(color: Colors.black54, fontSize: 24)
              ),),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text("Все",style: GoogleFonts.russoOne(
                      textStyle: const TextStyle(color: Colors.black45, fontSize: 20)
                    ),),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              )
            ],
          ),
        ),
        Obx(() => 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                // ignore: invalid_use_of_protected_member
                itemCount: ControllerGet.to.listCategory.value.length, 
                itemBuilder: (context, index, realindex) {
                  return CategoryCard(
                    // ignore: invalid_use_of_protected_member
                    category: ControllerGet.to.listCategory.value[index],
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.53,
                )
              ),
            ],
          )
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>CourseScreen(category: category));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), 
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                "http://89.111.131.40:8080/api/image/image/${category.image}",
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(category.name,style: GoogleFonts.russoOne(
                  textStyle: const TextStyle(color: Colors.black54,)
                ),textAlign: TextAlign.center,),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx (() => LinearProgressIndicator(
              value: ControllerGet.getCountComplitedProcent()[category.name] ?? 0,
              backgroundColor: Colors.black12,
              color: const Color.fromARGB(255, 223, 40, 62),
            )),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}