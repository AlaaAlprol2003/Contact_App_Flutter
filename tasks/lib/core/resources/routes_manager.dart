import 'package:flutter/material.dart';
import 'package:space_app_assignment/features/home_screen/home_screen.dart';


class RoutesManager {
  static const String intro = "/intro";
  static const String homeScreen = "/home";



  static Map<String , WidgetBuilder> routes = {
    
    homeScreen:(context)=> HomeScreen(),

 };
}

