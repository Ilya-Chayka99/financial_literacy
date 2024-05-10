import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DeteilsScreens extends StatefulWidget {
  Course course;
  Category category;
  DeteilsScreens({super.key, required this.course, required this.category});

  @override
  // ignore: no_logic_in_create_state
  State<DeteilsScreens> createState() => _DeteilsScreensState(course, category);
}

class _DeteilsScreensState extends State<DeteilsScreens> {
  Course course;
  Category category;
  _DeteilsScreensState(this.course, this.category);
  Future<void> getPartition() async {
    ControllerGet.to.listParagraph.value =
        await Repository.getPartitionChildren(category.name, course.name);
  }

  @override
  void initState() {
    getPartition();
    super.initState();
  }

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
                gradient: LinearGradient(
                  colors: [Color(0xff17203a), Color(0xff1e2962)],
                  stops: [0.25, 0.75],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
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
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Flexible(
                        child: Text(course.name,
                            style: GoogleFonts.russoOne(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            textAlign: TextAlign.center),
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
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                // ignore: invalid_use_of_protected_member
                ControllerGet.to.listParagraph.value[0].name,
                style: GoogleFonts.russoOne(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 14)),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
