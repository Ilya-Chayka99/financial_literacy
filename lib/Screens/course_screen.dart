import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Repositories/repository.dart';
import 'package:financial_literacy/Screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({super.key, required this.category});
  @override
  // ignore: no_logic_in_create_state
  State<CourseScreen> createState() => _CourseScreenState(category);
}

class _CourseScreenState extends State<CourseScreen> {
  final Category category;
  _CourseScreenState(this.category);
  Future<void> getPartition() async {
    ControllerGet.to.listCourse.value =
        await Repository.getPartition(category.name);
  }

  @override
  void initState() {
    getPartition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Text(widget.category.name,
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
            const SizedBox(
              height: 15,
            ),
            Obx(
              // ignore: invalid_use_of_protected_member
              () => ControllerGet.to.listCourse.value.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        separatorBuilder: (_, __) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        shrinkWrap: true,
                        itemBuilder: (_, int index) {
                          return CourseContainer(
                            // ignore: invalid_use_of_protected_member
                            course: ControllerGet.to.listCourse.value[index],
                            category: category,
                          );
                        },
                        // ignore: invalid_use_of_protected_member
                        itemCount: ControllerGet.to.listCourse.value.length,
                      ),
                    )
                  : Container(
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
                        "В данной категории еще не добавлено ни одного раздела, приходите позже O_O",
                        style: GoogleFonts.russoOne(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 14)),
                        textAlign: TextAlign.center,
                      ),
                    ),
            )
            // ignore: invalid_use_of_protected_member
          ],
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Course course;
  final Category category;
  const CourseContainer({
    super.key,
    required this.course,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        //ControllerGet.to.myMap[category.name][course.name] += 1
        Get.to(() => DeteilsScreens(course: course, category: category))
      },
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "http://89.111.131.40:8080/api/image/image/${course.image}",
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: GoogleFonts.russoOne(
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => LinearProgressIndicator(
                        value: ControllerGet.getCountComplitedProcentCourses()[
                                course.name] ??
                            0,
                        backgroundColor: Colors.black12,
                        color: const Color.fromARGB(255, 223, 40, 62),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
