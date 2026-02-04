import 'package:doctor_appointment/Notification.dart';
import 'package:doctor_appointment/ProfileScreen.dart';
import 'package:doctor_appointment/doctor_details_screen.dart';
import 'package:doctor_appointment/splashScreen.dart';
import 'package:flutter/material.dart';

import 'AppSideMenu.dart';
import 'book_appointment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
