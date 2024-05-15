
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  double basketX = 50;
  double basketWidth = 70;
  double basketY = 100;
  int score = 0;
  int money = 50;
  int mood = 50;
  int eat = 50;
  int lives = 3;
  int highScore = 0;
  List<Offset> itemMoney = [];
  List<Offset> itemEat = [];
  List<Offset> itemMood = [];
  Random random = Random();
  late Timer fruitTimer;
  late Timer dropTimer;

  @override
  void initState() {
    super.initState();
    fruitTimer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      addItem();
    });
    startItemDrop();
  }
  void addItem() {
    double x1 =
        random.nextDouble() * (MediaQuery.of(context).size.width - basketWidth);
    double x2 =
        random.nextDouble() * (MediaQuery.of(context).size.width - basketWidth);
    double x3 =
        random.nextDouble() * (MediaQuery.of(context).size.width - basketWidth);
    setState(() {
      itemMoney.add(Offset(x1, 0));
      itemMood.add(Offset(x2, 0));
      itemEat.add(Offset(x3, 0));
    });
  }

  void startItemDrop() {
    dropTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
      } else {
        updateFruitPosition();
      }
    });
  }

  void updateFruitPosition() {
    List<Offset> tempItem = [];
    List<Offset> tempItem2 = [];
    List<Offset> tempItem3 = [];
    bool shouldUpdateState = false;

    for (var it in itemMoney) {
      double newY = it.dy + 5;
       if (eat <= 0 || money <= 0 || mood <= 0) {
          fruitTimer.cancel();
          dropTimer.cancel();
          return;
      }
      if (newY >= 600 - 80 &&
          newY <= 600 + 80 &&
          it.dx >= basketX &&
          it.dx <= basketX + basketWidth) {
        score += 1;
        setState(() {
          money+=20;
          eat-=15;
          mood-=10;
        });
        if (score % 100 == 0) {
        }
        highScore = max(score, highScore);
        shouldUpdateState = true;
      } else {
        tempItem.add(Offset(it.dx, newY));
        shouldUpdateState = true;
      }
    }

    for (var it in itemMood) {
      double newY = it.dy + 7;
      if (eat <= 0 || money <= 0 || mood <= 0) {
          fruitTimer.cancel();
          dropTimer.cancel();
          return;
      }
      if (newY >= 600 - 80 &&
          newY <= 600 + 80 &&
          it.dx >= basketX &&
          it.dx <= basketX + basketWidth) {
        score += 1;
        setState(() {
          money-=10;
          eat-=10;
          mood+=20;
        });
        if (score % 100 == 0) {
        }
        highScore = max(score, highScore);
        shouldUpdateState = true;
      } else {
        tempItem2.add(Offset(it.dx, newY));
        shouldUpdateState = true;
      }
    }

    for (var it in itemEat) {
      double newY = it.dy + 9;
      if (eat <= 0 || money <= 0 || mood <= 0) {
          fruitTimer.cancel();
          dropTimer.cancel();
          return;
      }
      if (newY >= 600 - 80 &&
          newY <= 600 + 80 &&
          it.dx >= basketX &&
          it.dx <= basketX + basketWidth) {
        score += 1;
        setState(() {
          money-=10;
          eat+=20;
          mood+=5;
        });
        if (score % 100 == 0) {
        }
        highScore = max(score, highScore);
        shouldUpdateState = true;
      } else {
        tempItem3.add(Offset(it.dx, newY));
        shouldUpdateState = true;
      }
    }

    if (shouldUpdateState) {
      setState(() {
        itemMoney = tempItem;
        itemMood = tempItem2;
        itemEat = tempItem3;
      });
    }
  }

   void moveBasket(double dx) {
    setState(() {
      basketX = dx.clamp(0, MediaQuery.of(context).size.width - basketWidth);
    });
  }

  @override
  void dispose() {
    fruitTimer.cancel();
    dropTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          moveBasket(details.globalPosition.dx - basketWidth / 2);
        },
        child: Stack(
          children: buildGameObjects(),
        ),
      );
  }

  List<Widget> buildGameObjects() {
    List<Widget> widgets = [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 700,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/image/network-work-life-balance-and-setting-priorities.png"),
           
          ),
        ),
      ),
      Positioned(
        left: basketX,
        bottom: basketY,
        child: SizedBox(
          width: basketWidth, 
          child: Image.asset("lib/Assets/image/sammy-43.png"),
        ),
      ),
      Positioned(
        top: 50,
        right: 10,
        child: Text("Очки: $score",style: GoogleFonts.russoOne(
          textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 24)
        ),),
      ),
      Positioned(
        top: 0,
        left: 10,
        right: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("Средства",style: GoogleFonts.russoOne(
                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22)
                ),),
                SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(
                    value: money / 100,
                    backgroundColor: Colors.black12,
                    color: const Color.fromARGB(255, 18, 211, 0),
                  ),
                )
              ],
            ),

            Column(
              children: [
                Text("Настроение",style: GoogleFonts.russoOne(
                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22)
                ),),
                SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(
                    value: mood / 100,
                    backgroundColor: Colors.black12,
                    color: const Color.fromARGB(255, 18, 211, 0),
                  ),
                )
              ],
            ),

            Column(
              children: [
                Text("Сытость",style: GoogleFonts.russoOne(
                  textStyle: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22)
                ),),
                SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(
                    value: eat / 100,
                    backgroundColor: Colors.black12,
                    color: const Color.fromARGB(255, 18, 211, 0),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      ...itemMoney
          .map((item) => Positioned(
                left: item.dx,
                top: item.dy,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset("lib/Assets/image/casual-life-3d-cash-and-coins.png"),
                ),
              ))
          .toList(),

      ...itemMood
          .map((item) => Positioned(
                left: item.dx,
                top: item.dy,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset("lib/Assets/image/orange-man-sitting-in-a-relaxed-position-with-a-laptop.png"),
                ),
              ))
          .toList(),

      ...itemEat
          .map((item) => Positioned(
                left: item.dx,
                top: item.dy,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset("lib/Assets/image/shine-fast-food-combo-1.png"),
                ),
              ))
          .toList(),
    ];

    return widgets;
  }
}



