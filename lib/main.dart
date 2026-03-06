import 'package:doctor_appointment/HomeScreen.dart';
import 'package:doctor_appointment/Notification.dart';
import 'package:doctor_appointment/ProfileScreen.dart';
import 'package:doctor_appointment/doctor_details_screen.dart';
import 'package:doctor_appointment/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'AppSideMenu.dart';
import 'AppointmentBookDailog.dart';
import 'book_appointment_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      //home: HomeScreen(),
    );
  }
}
