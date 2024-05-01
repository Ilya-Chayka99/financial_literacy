
import 'package:financial_literacy/Models/question.dart';

class Course {
  String name;
  String image;
  List<Question> questions;
  
  Course({
    required this.name,
    required this.image,
    required this.questions
  });
}