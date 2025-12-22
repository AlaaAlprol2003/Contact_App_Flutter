import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app_assignment/core/resources/routes_manager.dart';



void main(){
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(402, 874),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
       debugShowCheckedModeBanner: false,
       routes: RoutesManager.routes,
      
       initialRoute: RoutesManager.homeScreen,
       
      ),
     
    );
  }
}