
import 'package:financial_literacy/Models/onboarding_info.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Планирование Бюджета", 
      decoration: "Наше приложение поможет вашему ребенку понять, как управлять своими деньгами. Он сможет создавать свои собственные бюджеты, отслеживать расходы и доходы, а также устанавливать цели и следить за их выполнением.", 
      image: "lib/Assets/Gif/bendy-budget-planning-doing-taxes-and-accounting.gif"),

    OnboardingInfo(
      title: "Умение Обращаться с Банками и Картами", 
      decoration: "Научим детей основам банковского обслуживания. Они узнают, как выбирать подходящий банк и карту, как проводить безопасные операции с деньгами, а также как эффективно использовать банковские услуги для своих целей.", 
      image: "lib/Assets/Gif/dazzle-online-banking.gif"),

    OnboardingInfo(
      title: "Умение Накапливать", 
      decoration: "Важный навык для будущего! С помощью нашего приложения дети научатся правильно распоряжаться своими сбережениями, планировать свое финансовое будущее и достигать желаемых целей.", 
      image: "lib/Assets/Gif/bubble-gum-blue-piggy-bank-with-bitcoin-coin.gif"),
      
    OnboardingInfo(
      title: "Соревнуйся с друзьями", 
      decoration: "Присоединяйтесь и прокачайте свои финансовые навыки, проходя увлекательные мини-игры и ответы на вопросы по различным темам. Чем больше заданий вы выполните, тем больше быллов вы заработаете! Покажите своим друзьям, что вы мастер финансовых стратегий, и поборитесь за звание самого финансово грамотного игрока!", 
      image: "lib/Assets/image/image-PhotoRoom.png-PhotoRoom (7).png"),
  ];
}