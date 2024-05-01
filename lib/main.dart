import 'package:financial_literacy/Components/my_app.dart';
import 'package:financial_literacy/GetX/Controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  Get.put(ControllerGet());
  runApp(const MyApp());
}