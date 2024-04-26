
import 'package:financial_literacy/Screens/my_home_page.dart';
import 'package:financial_literacy/Screens/splash/splash_screen.dart';
import 'package:get/get.dart';

final routes = [
         GetPage(name: '/', page: () => const SplashScreen()),
         GetPage(name: '/main', page: () => const MyHomePage()),
       
];