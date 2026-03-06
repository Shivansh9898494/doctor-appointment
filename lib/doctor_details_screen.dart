import 'package:doctor_appointment/HomeScreen.dart';
import 'package:doctor_appointment/book_appointment_screen.dart';
import 'package:flutter/material.dart';

import 'Models/DoctorModel.dart';

/// ==================
/// DOCTOR DETAILS SCREEN
/// ==================
class DoctorDetailsScreen extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  bool isFavorite = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.doctor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Doctor Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          )
        ],
      ),

      /// ==================
      /// BODY
      /// ==================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _doctorHeader(d),
            const SizedBox(height: 24),
            _statsRow(d),
            const SizedBox(height: 24),
            _aboutSection(d),
            const SizedBox(height: 24),
            _workingTime(d),
            const SizedBox(height: 24),
            _reviewsSection(),
            const SizedBox(height: 90),
          ],
        ),
      ),

      bottomNavigationBar: _bookButton(),
    );
  }

  /// ==================
  /// HEADER CARD
  /// ==================
  Widget _doctorHeader(Doctor d) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(.06),
            blurRadius: 12,
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              d.image,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  d.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  d.specialization,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        d.hospital,
                        style:
                        const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ==================
  /// STATS ROW
  /// ==================
  Widget _statsRow(Doctor d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatItem(Icons.people, d.patients, "patients"),
        _StatItem(Icons.badge, d.experience, "experience"),
        _StatItem(Icons.star, d.rating, "rating"),
        _StatItem(Icons.message, d.reviews, "reviews"),
      ],
    );
  }

  /// ==================
  /// ABOUT
  /// ==================
  Widget _aboutSection(Doctor d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About me",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        Text(d.about,
          /*isExpanded || d.about.length <= 90
              ? d.about
              : "${d.about.substring(0, 90)}...",*/
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),

        /*Text(
          isExpanded ? d.about : "${d.about.substring(0, 90)}...",
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
        */
        const SizedBox(height: 6),
        /*
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            isExpanded ? "View less" : "View more",
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        */
      ],
    );
  }

  /// ==================
  /// WORKING TIME
  /// ==================
  Widget _workingTime(Doctor d) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Working Time",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          d.workingTime,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  /// ==================
  /// REVIEWS
  /// ==================
  Widget _reviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Reviews",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("See All", style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/user1.png"),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emily Anderson",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Dr. Patel is a true professional who genuinely cares about his patients.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  /// ==================
  /// BOOK BUTTON
  /// ==================
  Widget _bookButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1C2A3A),
          minimumSize: const Size(double.infinity, 54),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookAppointmentScreen(doctor: widget.doctor),
              ),
          );
        },
        child: const Text(
          "Book Appointment",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

/// ==================
/// STAT ITEM
/// ==================
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem(this.icon, this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, size: 20, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
