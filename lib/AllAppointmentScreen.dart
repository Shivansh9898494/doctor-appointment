import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Allappointmentscreen extends StatefulWidget {

  @override
  State<Allappointmentscreen> createState() => _allAppointmentScreen();
}
class _allAppointmentScreen extends State<Allappointmentscreen> {
  @override
  Widget build (BuildContext){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: Text("All Appointemetn List"),
    );
  }
}