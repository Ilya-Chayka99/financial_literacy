
import 'package:flutter/material.dart';

class NavItemModel{
  final String title;
  final IconData icon;

  NavItemModel({required this.title,required this.icon});
}

List<NavItemModel> bottonNavItems = [
  NavItemModel(title: '1', icon: Icons.mail),
  NavItemModel(title: '2', icon: Icons.ac_unit),
  NavItemModel(title: 'Профиль', icon: Icons.perm_identity_sharp),

];