import 'package:doctor_appointment/Firebase/localPresistence.dart';
import 'package:flutter/material.dart';

import 'AppointmentCard.dart';
import 'Firebase/FirestoreService.dart';
import 'Models/AppointmentModel.dart';

class Allappointmentscreen extends StatefulWidget {
  @override
  State<Allappointmentscreen> createState() => _allAppointmentScreen();
}

class _allAppointmentScreen extends State<Allappointmentscreen> {

  List<AppointmentModel> allAppointments = [];
  List<AppointmentModel> myAppointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointment();
  }

  void loadAppointment() async {

    String? username = await LocalPersistence.get("username");

    allAppointments = await FirestoreService().fetchAppointment();

    print("All Appointments");
    print(allAppointments);

    for (var u in allAppointments) {
      if (u.Uname == username) {
        myAppointments.add(u);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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

      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: myAppointments.length,
                itemBuilder: (context, index) {
                  return AppointmentCard(
                    appointment: myAppointments[index],
                  );
                },
              )
          ),

        ],
      ),
    );
  }
}