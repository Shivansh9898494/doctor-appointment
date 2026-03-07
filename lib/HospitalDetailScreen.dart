import 'package:flutter/material.dart';

import 'Models/HospitalModel.dart';

class HospitalDetailsScreen extends StatelessWidget {

  final HospitalModel hospital;

  const HospitalDetailsScreen({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Hospital Details",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            //child: Icon(Icons.favorite_border),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Hospital Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      hospital.image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          hospital.name,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          hospital.type,
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 14,
                                color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                hospital.address,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                statItem(Icons.local_hospital,
                    hospital.doctorsCount.toString(), "Doctors"),

                statItem(Icons.people,
                    hospital.patientsCount.toString(), "Patients"),

                statItem(Icons.star,
                    hospital.rating.toString(), "Rating"),

                statItem(Icons.reviews,
                    hospital.reviews.toString(), "Reviews"),
              ],
            ),

            const SizedBox(height: 24),

            /// About
            sectionTitle("About Hospital"),

            const SizedBox(height: 8),

            Text(
              hospital.description,
              style: const TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            /// Working Time
            sectionTitle("Working Time"),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 6),
                Text(
                  hospital.workingHours,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Departments
            sectionTitle("Departments"),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: hospital.departments.map((dept) {
                return chipItem(dept);
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// Facilities
            sectionTitle("Facilities"),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: hospital.facilities.map((f) {
                return chipItem(f);
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// Contact
            sectionTitle("Contact"),

            const SizedBox(height: 10),

            contactItem(Icons.phone, hospital.phone),
            contactItem(Icons.email, hospital.email),
            contactItem(Icons.language, hospital.website),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget statItem(IconData icon, String value, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xffEEF1F8),
          child: Icon(icon, color: Colors.black54),
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  Widget chipItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xffEEF1F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  Widget contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}