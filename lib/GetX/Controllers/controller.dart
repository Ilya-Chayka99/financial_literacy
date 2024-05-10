import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Models/paragraph.dart';
import 'package:financial_literacy/Models/user.dart';
import 'package:get/get.dart';

class ControllerGet extends GetxController {
  static ControllerGet get to => Get.find();
  Map<String, dynamic> myMap = {
    "Деньги, личные финансы, семейный бюджет": <String, double>{"1": 0}.obs,
  }.obs;

  Rx<User> user = User(image: "", name: "name", email: "email").obs;

  RxList<Category> listCategory = [Category(name: "name", image: "image")].obs;
  RxList<Course> listCourse = [Course(name: "name", image: "image")].obs;
  RxList<Paragraph> listParagraph =
      [Paragraph(name: "name", image: "image", desc: '')].obs;

  static Map<String, double> getCountComplitedProcent() {
    Map<String, double> map = {};
    for (var i = 0; i < categoryList.length; i++) {
      map.addAll({categoryList[i].name: .0}.obs);
      num tmp = 0;
      ControllerGet.to.myMap[categoryList[i].name].forEach((key, value) {
        tmp = tmp + value;
        map[categoryList[i].name] = tmp / (10 * 10);
      });
    }
    return map;
  }

  static Map<String, dynamic> getCountComplitedProcentCourses() {
    Map<String, dynamic> map = {};
    for (var i = 0; i < categoryList.length; i++) {
      ControllerGet.to.myMap[categoryList[i].name].forEach((key, value) {
        map.addAll({key.toString(): value / 10.0}.obs);
      });
    }
    return map;
  }

  static void init() {
    Map<String, dynamic> map = {};
    for (var i = 0; i < categoryList.length; i++) {
      map.addAll({categoryList[i].name: <String, int>{}.obs}.obs);
      for (var j = 0; j < 10; j++) {
        // map[categoryList[i].name].addAll({categoryList[i].courses[j].name:0}.obs);
      }
    }
    ControllerGet.to.myMap = map;
  }
}
