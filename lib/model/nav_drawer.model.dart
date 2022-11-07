import 'package:flutter/cupertino.dart';

class NavDrawerItem {
  String title;
  IconData icon;
  int index;
  List<Map<String, dynamic>> children;
  bool isOpen;

  NavDrawerItem(
      {required this.title,
      required this.icon,
      required this.children,
      required this.isOpen,
      required this.index});
}