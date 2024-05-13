import 'package:financial_literacy/Components/paragraphTitle.dart';
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
        await Repository.getPartitionChildren(category.name, course.id);
    ControllerGet.to.listQuestion.value =
        await Repository.getPartitionQuestion(course.id);
  }

  int sum = 0;
  int currIndexQ = 0;
  int selectedNum = -1;
  bool complited = false;

  @override
  void initState() {
    getPartition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Obx(() => SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                // ignore: invalid_use_of_protected_member, prefer_is_empty
                child: ControllerGet.to.listParagraph.value.length !=0 ? ListView.builder(
                  // ignore: invalid_use_of_protected_member
                  itemCount: ControllerGet.to.listParagraph.value.length,
                  itemBuilder: (context, index) => ParagraphTitle(
                      paragraph:
                          // ignore: invalid_use_of_protected_member
                          ControllerGet.to.listParagraph.value[index]),
                ): Container(
                      height: 50,
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
                        "В данной разделе еще не добавлено ни одного пункта, приходите позже O_O",
                        style: GoogleFonts.russoOne(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 14)),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ))
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff17203a), Color(0xff1e2962)],
              stops: [0.25, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Obx(
              () => TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  // ignore: invalid_use_of_protected_member, prefer_is_empty
                  if (ControllerGet.to.listQuestion.value.length > 0) {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return SizedBox(
                                height: 700,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Проверка занний",
                                        style: GoogleFonts.russoOne(
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Column(
                                        children: [
                                          Text(
                                              // ignore: invalid_use_of_protected_member
                                              "Вопрос ${currIndexQ + 1} / ${ControllerGet.to.listQuestion.value.length}",
                                              style: GoogleFonts.russoOne(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                              textAlign: TextAlign.center),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // ignore: invalid_use_of_protected_member
                                          Text(ControllerGet.to.listQuestion.value[currIndexQ].title,
                                              style: GoogleFonts.russoOne(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                              textAlign: TextAlign.center),
                                          // ignore: invalid_use_of_protected_member
                                          ...List.generate( ControllerGet.to.listQuestion.value[currIndexQ].listOtv.length, (index) => 
                                          Column(
                                            children: [
                                              const SizedBox(height: 20,),
                                              InkWell(
                                                onTap: () {
                                                  setState((){
                                                    selectedNum = index;
                                                  });
                                                },
                                                child: Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  20),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: selectedNum == index ? const Color.fromARGB(255, 167, 174, 70) : const Color(0xFFC1C1C1)),
                                                              borderRadius:
                                                                  BorderRadius.circular(15)),
                                                          child: Row(
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                    ControllerGet
                                                                        .to
                                                                        .listQuestion
                                                                        // ignore: invalid_use_of_protected_member
                                                                        .value[currIndexQ]
                                                                        .listOtv[index],
                                                                    softWrap: true,
                                                                    style: GoogleFonts.russoOne(
                                                                        textStyle: TextStyle(
                                                                            color: selectedNum == index ?const Color.fromARGB(255, 167, 174, 70) : const Color(
                                                                                0xFF46A0AE),
                                                                            fontSize:
                                                                                16)),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(selectedNum >=0){
                                            // ignore: invalid_use_of_protected_member
                                            if(ControllerGet.to.listQuestion.value[currIndexQ]
                                              // ignore: invalid_use_of_protected_member
                                              .listOtv[selectedNum] == ControllerGet.to.listQuestion.value[currIndexQ].numOtv){
                                                sum++;
                                            }
                                          }
                                          if(currIndexQ + 1 >= 9){
                                            complited = true;
                                            currIndexQ = 0;
                                            if(sum > (ControllerGet.getCountComplitedProcentCourses(category.name, course.name)*9).toInt()){
                                              Repository.complit(ControllerGet.to.user.value.email, course.id, sum);
                                              Repository.addMoney(ControllerGet.to.user.value.email, 
                                              (sum - (ControllerGet.getCountComplitedProcentCourses(category.name, course.name)*9).toInt()) * 10, "За тест");
                                              Future.delayed(const Duration(seconds: 1),
                                                () {
                                                  ControllerGet.initProg();
                                                  Navigator.pop(context);
                                                });
                                            }
                                            else {
                                              sum = 0;
                                              Navigator.pop(context);
                                            }
                                            sum = 0;
                                          }else{
                                            currIndexQ++;
                                          }
                                          selectedNum = -1;
                                        });
                                      },
                                      child: Container(
                                        width: 200,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(15),
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF46A0AE),
                                                Color(0xFF00FFCB)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        child: Text("Следующий вопрос",
                                            style: GoogleFonts.russoOne(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        });
                  }
                },
                child: Text(
                  // ignore: invalid_use_of_protected_member, prefer_is_empty
                  ControllerGet.to.listQuestion.value.length > 0
                      ?
                      // ignore: invalid_use_of_protected_member
                      "Пройти тестирование по теме раздела\n${(ControllerGet.getCountComplitedProcentCourses(category.name, course.name) * 9).toInt()} / ${ControllerGet.to.listQuestion.value.length}"
                      : "В данной теме еще не добавлена проверка знаний",
                  style: GoogleFonts.russoOne(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ),
    );
  }
}
