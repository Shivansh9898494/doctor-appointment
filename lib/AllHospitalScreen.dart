import 'package:doctor_appointment/HomeScreen.dart';
import 'package:flutter/material.dart';

class HospitalListScreen extends StatelessWidget {
  const HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hospitals = [
      {
        "name": "Sunrise Health Clinic",
        "address": "123 Oak Street, Los Angeles, CA",
        "rating": "5.0",
        "reviews": "128 Reviews",
        "distance": "2.5 km • 40 min",
        "type": "Clinic",
        "image": "assets/images/hospital1.png",
      },
      {
        "name": "Golden Cardiology Center",
        "address": "555 Bridge Street, San Francisco, CA",
        "rating": "4.9",
        "reviews": "58 Reviews",
        "distance": "1.8 km • 25 min",
        "type": "Specialty Hospital",
        "image": "assets/images/hospital2.png",
      },
      {
        "name": "City Care Medical Center",
        "address": "789 Main Road, New York, NY",
        "rating": "4.8",
        "reviews": "214 Reviews",
        "distance": "3.1 km • 45 min",
        "type": "Hospital",
        "image": "assets/images/hospital3.png",
      },
      {
        "name": "Green Valley Hospital",
        "address": "45 Green Valley Ave, Denver, CO",
        "rating": "4.7",
        "reviews": "176 Reviews",
        "distance": "4.0 km • 50 min",
        "type": "Hospital",
        "image": "assets/images/hospital4.png",
      },
      {
        "name": "Hopewell Medical Clinic",
        "address": "890 Sunset Blvd, Miami, FL",
        "rating": "4.6",
        "reviews": "92 Reviews",
        "distance": "2.0 km • 30 min",
        "type": "Clinic",
        "image": "assets/images/hospital5.png",
      },
      {
        "name": "Northside Children’s Hospital",
        "address": "210 Maple Street, Chicago, IL",
        "rating": "4.9",
        "reviews": "305 Reviews",
        "distance": "5.2 km • 1 hr",
        "type": "Children Hospital",
        "image": "assets/images/hospital6.png",
      },
    ];


    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          /* onPressed: () {
            Navigator.pop(context);
          },*/
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          "Hospitals",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return _hospitalCard(hospitals[index]);
        },
      ),
    );
  }

  // 🔹 Hospital Card
  Widget _hospitalCard(Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  data["image"]!,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                // Address
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        data["address"]!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Rating
                Row(
                  children: [
                    Text(
                      data["rating"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    const Icon(Icons.star,
                        size: 16, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text(
                      "(${data["reviews"]})",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                //const SizedBox(height: 12),
                const Divider(
                  thickness: 1,
                  color: Color(0xffE5E7EB),
                ),

                const SizedBox(height: 12),

                // Bottom Info
                Row(
                  children: [
                    const Icon(Icons.directions_walk,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      data["distance"]!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.local_hospital,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          data["type"]!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
