
import 'dart:math';

import 'package:financial_literacy/Components/animated_bar.dart';
import 'package:financial_literacy/Components/list_contents.dart';
import 'package:financial_literacy/Screens/side_menu_profile.dart';
import 'package:financial_literacy/Models/nav_item_model.dart';
import 'package:flutter/material.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
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
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF17203A).withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF17203A).withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20
              )
            ]
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
                        height: 40,
                        width: 40,
                        child: Icon(bottonNavItems[index].icon,color: selectedNavIndex == index ? Colors.white : Colors.grey,),
                      ),
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
