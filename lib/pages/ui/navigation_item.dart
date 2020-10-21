import 'package:flutter/material.dart';
import 'package:zomato_test/common/strings.dart';

class NavigationItem {
  String title;
  IconData icon;

  NavigationItem({this.title, this.icon});
}

List<NavigationItem> navigationItems = [

  NavigationItem(title: Strings.my_profile, icon: Icons.person_rounded),

  NavigationItem(title: Strings.notifications, icon: Icons.notifications),
  NavigationItem(title: Strings.invoice, icon: Icons.monetization_on),
  NavigationItem(title: Strings.home, icon: Icons.home),
];
