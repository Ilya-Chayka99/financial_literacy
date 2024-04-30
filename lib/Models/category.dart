

import 'package:financial_literacy/Models/course.dart';

class Category{
  String image;
  String name;
  List<Course> courses;
  double complitedProcentage;

  Category({
    required this.name,
    required this.image,
    required this.complitedProcentage,
    required this.courses,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Деньги, личные финансы, семейный бюджет', 
    image: 'lib/Assets/Gif/florid-web-wallet-and-online-banking.gif',
    complitedProcentage: .5,
    courses: [
      Course(
        name: 'Функции и виды денег. Деньги: история и современность', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Человеческий капитал', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Совокупный капитал человека (семьи). Личные финансы,семейный бюджет и финансовое планирование', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
    ]
  ),
  Category(
    name: 'Банки и небанковские профессиональные кредиторы', 
    image: 'lib/Assets/Gif/dazzle-line-online-banking.gif',
    complitedProcentage: 0,
    courses: [
      Course(
        name: 'Банковская система и услуги для населения. Банковские вклады', 
        complitedProcentage: .75, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Банковские кредиты', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Небанковские профессиональные кредиторы и предоставляемые ими займы', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
    ]
  ),
  Category(
    name: 'Фондовый и валютный рынки, финансовые инструменты', 
    image: 'lib/Assets/Gif/storyline-cryptocurrency-and-nft-market-analytics.gif',
    complitedProcentage: 0,
    courses: [
      Course(
        name: 'Финансовый рынок, его структура и основные виды ценных бумаг', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Акции', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Облигации', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Паевые инвестиционные фонды', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
      Course(
        name: 'Валютный рынок и совершаемые на нем операции', 
        complitedProcentage: 0, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      ),
    ]
  ),
  Category(
    name: 'Страхование как механизм снижения рисков', 
    image: 'lib/Assets/Gif/simplistic-online-insurance-services-with-electronic-signature.gif',
    complitedProcentage: 0,
    courses: [
      Course(
        name: 'Сущность, формы и основные виды страхования', 
        complitedProcentage: .75, 
        image: 'lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png'
      )
    ]
  ),
];