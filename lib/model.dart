import 'package:flutter/material.dart';


class NavigationModel{
  String title;
  IconData icon;

  NavigationModel({this.title,this.icon});


}

List<NavigationModel> navigationItems =[
  NavigationModel(title:"Home",icon:Icons.home,),
  NavigationModel(title:"AC Configuration",icon:Icons.ac_unit,),
  NavigationModel(title:"Light Configuration",icon:Icons.highlight),
  NavigationModel(title:"Sensor Monitor",icon:Icons.settings_overscan),
  NavigationModel(title:"Help",icon:Icons.help),
];

