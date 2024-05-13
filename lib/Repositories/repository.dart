import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Models/paragraph.dart';
import 'package:financial_literacy/Models/question.dart';
import 'package:financial_literacy/Models/user.dart';
import 'package:get/get.dart' as Get;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static Future<String> seveImage(File file) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: File(file.path).uri.pathSegments.last)
    });
    final response =
        await Dio().post('http://89.111.131.40:8080/api/image/upload',
            options: Options(
              contentType: 'multipart/form-data',
            ),
            data: formData);
    final data = json.decode(response.data);

    return data["article"].toString();
  }

  static Future<User?> loginUser(String email, String password) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/user/getInfo',
          queryParameters: {'email': email, 'password': password});
      final data = json.decode(response.data);
      return User(
          image: data["image"]["article"],
          name: data["name"],
          email: data["email"],
          money: data["money"],
          rank: data["rank"]);
    } catch (e) {
      return null;
    }
  }

  static Future<List<User>> getTop100() async {
    try {
      final response = await Dio().post(
        'http://89.111.131.40:8080/api/user/getTop100',
      );
      final data = json.decode(response.data);
      List<dynamic> list = data['users'];
      List<User> users = [];
      for (var i = 0; i < list.length; i++) {
        users.add(User(
            image: list[i]["image"]["article"],
            name: list[i]["name"],
            email: list[i]["email"],
            money: list[i]["money"],
            rank: 0));
      }
      return users;
    } catch (e) {
      return [];
    }
  }

  static Future<User?> registerUser(
      String email, String password, String avatarArticle, String name) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/user/register',
          queryParameters: {
            'email': email,
            'password': password,
            'avatarArticle': avatarArticle,
            'name': name
          });
      final data = json.decode(response.data);
      return User(
          image: data["image"]["article"],
          name: data["name"],
          email: data["email"],
          money: data["money"],
          rank: data["rank"]);
    } catch (e) {
      return null;
    }
  }

  static Future<void> complit(
      String email, int partitionId, int progress) async {
    try {
      // ignore: unused_local_variable
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/partitioncompleteness/progress',
          queryParameters: {
            'email': email,
            'partitionId': partitionId,
            'progress': progress
          });
      // ignore: empty_catches
    } catch (e) {}
  }

  static Future<void> addMoney(
      String email, int money, String desc) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // ignore: unused_local_variable
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/user/addMoney',
          queryParameters: {
            'email': email,
            'money': money,
            'desc': desc,
            'password': prefs.getString("pass")!
          });
      // ignore: empty_catches
    } catch (e) {}
  }

  static Future<Map<String, Get.RxMap<dynamic, dynamic>>>
      getPartitioncompleteness(String email) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/partitioncompleteness/get',
          queryParameters: {
            'email': email,
          });
      final data = json.decode(response.data);
      List<dynamic> list = data['partitionCompletenesses'];
      Map<String, Get.RxMap<dynamic, dynamic>> partitionCompletenesses = {};
      for (var i = 0; i < list.length; i++) {
        partitionCompletenesses
            .addAll({list[i]["partition"]["category"]["name"]: {}.obs});
      }
      for (var i = 0; i < list.length; i++) {
        String a = list[i]["partition"]["category"]["name"];
        partitionCompletenesses[a]!
            .addAll({list[i]["partition"]["title"]: list[i]["progress"]}.obs);
      }
      return partitionCompletenesses;
    } catch (e) {
      return {};
    }
  }

  static Future<List<Category>> getCategory() async {
    try {
      final response =
          await Dio().post('http://89.111.131.40:8080/api/category/get');
      final data = json.decode(response.data);
      List<dynamic> list = data['categoryes'];
      List<Category> categoryes = [];
      for (var i = 0; i < list.length; i++) {
        categoryes
            .add(Category(name: list[i]["name"], image: list[i]["image"]));
      }
      return categoryes;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Course>> getPartition(String nameCategory) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/partition/get',
          queryParameters: {'categoryName': nameCategory});
      final data = json.decode(response.data);
      List<dynamic> list = data['partitions'];
      List<Course> course = [];

      for (var i = 0; i < list.length; i++) {
        if (list[i]["fatherPartition"] != null) {
          continue;
        } else {
          course.add(Course(
              name: list[i]["title"],
              image: list[i]["image"]["article"],
              id: list[i]["id"]));
        }
      }
      return course;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Paragraph>> getPartitionChildren(
      String nameCategory, int nameID) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/partition/get',
          queryParameters: {'categoryName': nameCategory});
      final data = json.decode(response.data);
      List<dynamic> list = data['partitions'];
      List<Paragraph> paragraph = [];
      for (var i = 0; i < list.length; i++) {
        if (list[i]["fatherPartition"] == null) {
          continue;
        } else {
          if (list[i]["fatherPartition"] == nameID) {
            paragraph.add(Paragraph(
                name: list[i]["title"],
                image:
                    list[i]["image"] == null ? "" : list[i]["image"]["article"],
                desc: list[i]["description"]));
          } else {
            continue;
          }
        }
      }
      return paragraph;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Question>> getPartitionQuestion(int nameID) async {
    try {
      final response = await Dio().post(
          'http://89.111.131.40:8080/api/quizquestion/get',
          queryParameters: {'partitionId': nameID});
      final data = json.decode(response.data);
      List<dynamic> list = data['quizQuestions'];
      List<Question> quizQuestions = [];
      for (var i = 0; i < list.length; i++) {
        quizQuestions.add(Question(
            title: list[i]["title"],
            numOtv: list[i]["goodAnswer"],
            text: list[i]["text"],
            listOtv: list[i]["answers"]));
      }
      return quizQuestions;
    } catch (e) {
      return [];
    }
  }
}
