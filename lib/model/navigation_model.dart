import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}


List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.arrow_back),
  NavigationModel(title: "Home", icon: Icons.home),
  NavigationModel(title: "Search", icon: Icons.search),
  NavigationModel(title: "Error", icon: Icons.error),
  NavigationModel(title: "Settings", icon: Icons.settings),

];