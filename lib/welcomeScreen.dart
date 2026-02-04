import 'package:doctor_appointment/LoginScreen.dart';
import 'package:flutter/material.dart';

class welcomeScreen extends StatelessWidget {
 // const welcomeScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Image section
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/doctor1.png', // change name if needed
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content section
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "Meet Doctors Online",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1E2A3A),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Connect with Specialized Doctors Online for\n"
                          "Convenient and Comprehensive Medical\n"
                          "Consultations.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 30),

                    // Next button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1E2A3A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) =>  LoginScreen()),
                          );
                        },
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot({bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff1E2A3A) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
