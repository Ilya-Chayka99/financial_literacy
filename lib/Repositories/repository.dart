
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:financial_literacy/Models/user.dart';

class Repository{
  static Future<String> seveImage(File file) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: File(file.path).uri.pathSegments.last)
    });
    final response = await Dio()
    .post('http://89.111.131.40:8080/api/image/upload',
      options: Options(
        contentType: 'multipart/form-data',),
        data: formData
    );
    final data = json.decode(response.data);
 
    return data["article"].toString();
  }

  static Future<User?> loginUser(String email,String password) async {
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    try{
      final response = await Dio()
      .post('http://89.111.131.40:8080/api/user/getInfo',
        data: formData
      );
      final data = json.decode(response.data);
      return User(image: data["image"]["article"], name: data["name"], email: data["email"]);
    }catch(e){
      return null;
    }
    
  }

  static Future<User?> registerUser(String email,String password, String avatarArticle,String name) async {
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
      'avatarArticle': avatarArticle,
      'name': name
    });
    try{
      final response = await Dio()
      .post('http://89.111.131.40:8080/api/user/register',
        data: formData
      );
      final data = json.decode(response.data);
      return User(image: data["image"]["article"], name: data["name"], email: data["email"]);
    }catch(e){
      return null;
    }
    
  }


}

