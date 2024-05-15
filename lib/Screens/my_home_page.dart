
import 'dart:math';
import 'package:financial_literacy/Components/animated_bar.dart';
import 'package:financial_literacy/Components/list_contents.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Repositories/repository.dart';
import 'package:financial_literacy/Screens/side_menu_profile.dart';
import 'package:financial_literacy/Models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int selectedNavIndex = 0;
  int selectedNavIndexAnim = 0;
  bool isSideMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
 
 @override
  void initState() {
    ControllerGet.init();
    _animationController = AnimationController(
      vsync: this ,
      duration: const Duration(milliseconds: 200)
    )..addListener((){
      setState(() {});
    });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    getCategory();
    ControllerGet.initProg();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getCategory() async {
    ControllerGet.to.listCategory.value = await Repository.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff17203a), Color(0xff1e2962)],
            stops: [0.25, 0.75],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 200),
              width: 288,
              right: isSideMenuOpen ? 20 : -288,
              height:  MediaQuery.of(context).size.height,
              child: const SideMenuProfile()
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-animation.value + 30 * animation.value * pi / 180 ),
              child: Transform.translate(
                offset: Offset(animation.value * - 300, 0),
                child: Transform.scale(
                  scale: scalAnimation.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(isSideMenuOpen ? 24 : 0)),
                    child: content[selectedNavIndexAnim]
                  )
                )
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient:LinearGradient(
              colors: [Color(0xff17203a), Color(0xff1e2962)],
              stops: [0.25, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottonNavItems.length, 
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNavIndex = index;
                    if(index == bottonNavItems.length - 1) {
                      isSideMenuOpen = true;
                      _animationController.forward();
                    } else {
                      selectedNavIndexAnim = index;
                      isSideMenuOpen = false;
                      _animationController.reverse();
                    }
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min ,
                  children: [
                    AnimatedBar(isActive: selectedNavIndex == index,),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(bottonNavItems[index].icon,color: selectedNavIndex == index ? Colors.white : Colors.grey,),
                      ),
                      Text(bottonNavItems[index].title,style: GoogleFonts.russoOne(
                        textStyle: TextStyle(color:selectedNavIndex == index ? Colors.white : Colors.grey, fontSize: 14)
                      ),),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
