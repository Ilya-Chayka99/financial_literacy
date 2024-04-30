

class Category{
  String image;
  String name;

  Category({
    required this.name,
    required this.image
  });
}

List<Category> categoryList = [
  Category(
    name: 'Деньги, личные финансы, семейный бюджет и финансовое планирование.', 
    image: 'lib/Assets/Gif/florid-web-wallet-and-online-banking.gif'
  ),
  Category(
    name: 'Банки и небанковские профессиональные кредиторы', 
    image: 'lib/Assets/Gif/dazzle-line-online-banking.gif'
  ),
  Category(
    name: 'Фондовый и валютный рынки, финансовые инструменты', 
    image: 'lib/Assets/Gif/storyline-cryptocurrency-and-nft-market-analytics.gif'
  ),
  Category(
    name: 'Страхование как механизм снижения рисков', 
    image: 'lib/Assets/Gif/simplistic-online-insurance-services-with-electronic-signature.gif'
  ),
];