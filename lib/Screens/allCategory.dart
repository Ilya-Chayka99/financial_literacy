
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});
  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  

  @override
  void initState() {
    ControllerGet.initProg();
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
                          child: Text("Категории",
                              style: GoogleFonts.russoOne(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 21)),
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
            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return CategoryContainerAll(
                    // ignore: invalid_use_of_protected_member
                    category: ControllerGet.to.listCategory.value[index],
                  );
                },
                // ignore: invalid_use_of_protected_member
                itemCount: ControllerGet.to.listCategory.value.length,
              ),
            )

          ],
        ),
      ),
    );
  }
}

class CategoryContainerAll extends StatelessWidget {
  final Category category;
  const CategoryContainerAll({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.to(() => CourseScreen(category: category))
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
                "http://89.111.131.40:8080/api/image/image/${category.image}",
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
                    category.name,
                    style: GoogleFonts.russoOne(
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => LinearProgressIndicator(
                        value: ControllerGet.getCountComplitedProcent(category.name),
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
