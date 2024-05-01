
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/user.dart';
import 'package:get/get.dart';

class ControllerGet extends GetxController {

  static ControllerGet get to => Get.find();
  Map<String, dynamic> myMap = {
    "Деньги, личные финансы, семейный бюджет": <String,double>{"1":0}.obs,
  }.obs;
  
  Rx<User> user = User(image: "", name: "name", email: "email").obs;

  static Map<String,double>  getCountComplitedProcent (){
    Map<String,double> map ={};
    for (var i = 0; i < categoryList.length; i++) {
      map.addAll({categoryList[i].name:.0}.obs);
      num tmp = 0;
      ControllerGet.to.myMap[categoryList[i].name].forEach((key, value) {
        tmp = tmp + value;
        map[categoryList[i].name] = tmp / (categoryList[i].courses.length * 10);
      });
    }
    return map;
  }

  static Map<String,dynamic>  getCountComplitedProcentCourses (){
    Map<String,dynamic> map ={};
    for (var i = 0; i < categoryList.length; i++) {
      ControllerGet.to.myMap[categoryList[i].name].forEach((key, value) {
        map.addAll({ key.toString(): value / 10.0}.obs);
      });
    }
    return map;
  }

  static void init (){
    Map<String,dynamic> map = {};
    for (var i = 0; i < categoryList.length; i++) {
      map.addAll({categoryList[i].name:<String,int>{}.obs}.obs);
      for (var j = 0; j < categoryList[i].courses.length; j++) {
        map[categoryList[i].name].addAll({categoryList[i].courses[j].name:0}.obs);
      }
    }
    ControllerGet.to.myMap = map;
  }
}