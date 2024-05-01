
import 'package:flutter/material.dart';

class NavItemModel{
  final String title;
  final IconData icon;

  NavItemModel({required this.title,required this.icon});
}

List<NavItemModel> bottonNavItems = [
  NavItemModel(title: 'Основная', icon: Icons.home),
  NavItemModel(title: 'Рэйтинг', icon: Icons.assessment),
  NavItemModel(title: 'Профиль', icon: Icons.perm_identity_sharp),

];