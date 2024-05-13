import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Models/paragraph.dart';
import 'package:financial_literacy/Models/question.dart';
import 'package:financial_literacy/Models/user.dart';
import 'package:financial_literacy/Repositories/repository.dart';
import 'package:get/get.dart';

class ControllerGet extends GetxController {
  static ControllerGet get to => Get.find();
  Map<String, dynamic> myMap = {
    "Деньги, личные финансы, семейный бюджет": <String, double>{"1": 0}.obs,
  }.obs;

  Rx<User> user =
      User(image: "", name: "name", email: "email", money: 0, rank: 0).obs;

  RxList<Category> listCategory = [Category(name: "name", image: "image")].obs;
  RxList<Course> listCourse = [Course(name: "name", image: "image", id: 0)].obs;
  RxList<Paragraph> listParagraph =
      [Paragraph(name: "name", image: "image", desc: '')].obs;
  RxList<Question> listQuestion = [
    Question(title: "title", listOtv: [], numOtv: "numOtv", text: "text")
  ].obs;
  RxList<User> listUserTop = [
    User(image: "image", name: "name", email: "email", money: 0, rank: 1)
  ].obs;

  RxMap<String, RxMap<dynamic, dynamic>> mapProg = RxMap({});

  static double getCountComplitedProcent(String categoryName) {
    if (ControllerGet.to.mapProg[categoryName] != null) {
      num tmp = 0;
      ControllerGet.to.mapProg[categoryName]!.forEach((key, value) {
        tmp = tmp + (value / 9);
      });
      // ignore: invalid_use_of_protected_member
      return ControllerGet.to.mapProg.value[categoryName] == null
          ? 0
          :
          // ignore: invalid_use_of_protected_member, prefer_is_empty
          (ControllerGet.to.mapProg.value[categoryName]?.length == 0
              ? 0
              // ignore: invalid_use_of_protected_member
              : tmp / ControllerGet.to.mapProg.value[categoryName]!.length);
    } else {
      return 0;
    }
  }

  static double getCountComplitedProcentCourses(
      String categoryName, String partitionName) {
    if (ControllerGet.to.mapProg[categoryName] != null) {
      if (ControllerGet.to.mapProg[categoryName]![partitionName] != null) {
        return ControllerGet.to.mapProg[categoryName]![partitionName] / 9;
      } else {
        return .0;
      }
    } else {
      return .0;
    }
  }

  static Future<void> initProg() async {
    ControllerGet.to.mapProg.value = await Repository.getPartitioncompleteness(
        ControllerGet.to.user.value.email);
  }

  static Future<void> init() async {
    ControllerGet.to.listUserTop.value = await Repository.getTop100();
    ControllerGet.to.mapProg.value = await Repository.getPartitioncompleteness(
        ControllerGet.to.user.value.email);
  }
}
