import 'package:doctor_appointment/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointmentbookdailog extends StatelessWidget {

  final String name;
  final String month;
  final String date;
  final String year;
  final String time;

  const Appointmentbookdailog({
    super.key,
    required this.name,
    required this.month,
    required this.date,
    required this.year,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/check.png",
              width: 80,
              height: 80,
              color: Colors.greenAccent,
            ),

            const SizedBox(height: 25),

            const Text(
              "Congratulations!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Your appointment with $name is confirmed for $month $date, $year at $time",
              style: const TextStyle(color: Colors.grey,fontSize: 12),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1C2A3A),
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                ///Appointment Booking Save
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) =>  HomeScreen()),
                );

              },
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class Appointmentbookdailog extends StatelessWidget {
  var name = "Dr.David Patel";
  var day = "June 30, 2025";
  var time = "10.00 AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/check.png",
            width: 80,
            height: 80,
            color: Colors.greenAccent,
          ),

          SizedBox(height: 25,),
          Text("Congratulations!",
            style: TextStyle(color: Colors.black,
              fontWeight: .bold,
            ),
          ),
          SizedBox(height: 20,),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Text(
                "Your appointment with $name is confirmed for $day at $time",
                style: TextStyle(color: Colors.grey),
                textAlign: .center,
              )
          ),

          Padding(
            padding: const EdgeInsets.all(36),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1C2A3A),
                minimumSize: const Size(double.infinity, 52),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.pop(context);

              },
              child: const Text(
                "Done", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}*/