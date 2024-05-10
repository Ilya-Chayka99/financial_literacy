import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:financial_literacy/Models/category.dart';
import 'package:financial_literacy/Models/course.dart';
import 'package:financial_literacy/Models/paragraph.dart';
import 'package:financial_literacy/Models/user.dart';

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
          email: data["email"]);
    } catch (e) {
      return null;
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
          email: data["email"]);
    } catch (e) {
      return null;
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
              name: list[i]["title"], image: list[i]["image"]["article"]));
        }
      }
      return course;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Paragraph>> getPartitionChildren(
      String nameCategory, String namePartition) async {
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
          if (list[i]["fatherPartition"]["title"] == namePartition) {
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
}
