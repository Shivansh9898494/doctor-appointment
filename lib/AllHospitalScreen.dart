import 'package:doctor_appointment/HomeScreen.dart';
import 'package:doctor_appointment/HospitalDetailScreen.dart';
import 'package:flutter/material.dart';

import 'Models/HospitalModel.dart';

class HospitalListScreen extends StatelessWidget {
  const HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<HospitalModel> hospitals = [
      HospitalModel(
        name: "Sunrise Health Clinic",
        address: "123 Oak Street, Los Angeles, CA",
        rating: 5.0,
        reviews: 128,
        distance: "2.5 km • 40 min",
        type: "Clinic",
        image: "assets/images/hospital1.png",
        phone: "+1 234 567 890",
        email: "info@sunriseclinic.com",
        website: "www.sunriseclinic.com",
        description: "A modern clinic providing high quality healthcare services.",
        workingHours: "Mon - Sun | 8:00 AM - 10:00 PM",
        doctorsCount: 25,
        patientsCount: 2000,
        departments: ["Cardiology", "Dermatology", "Orthopedics"],
        facilities: ["Emergency", "Pharmacy", "Laboratory", "Parking"],
        latitude: 34.0522,
        longitude: -118.2437,
      ),

      HospitalModel(
        name: "Golden Cardiology Center",
        address: "555 Bridge Street, San Francisco, CA",
        rating: 4.9,
        reviews: 58,
        distance: "1.8 km • 25 min",
        type: "Specialty Hospital",
        image: "assets/images/hospital2.png",
        phone: "+1 987 654 321",
        email: "contact@goldencardiology.com",
        website: "www.goldencardiology.com",
        description: "Specialized hospital focused on heart related treatments.",
        workingHours: "Mon - Sat | 9:00 AM - 8:00 PM",
        doctorsCount: 18,
        patientsCount: 1500,
        departments: ["Cardiology", "Heart Surgery"],
        facilities: ["Emergency", "Ambulance", "ICU"],
        latitude: 37.7749,
        longitude: -122.4194,
      ),

      HospitalModel(
        name: "City Care Medical Center",
        address: "789 Main Road, New York, NY",
        rating: 4.8,
        reviews: 214,
        distance: "3.1 km • 45 min",
        type: "Hospital",
        image: "assets/images/hospital3.png",
        phone: "+1 111 222 333",
        email: "info@citycare.com",
        website: "www.citycare.com",
        description: "Large multi-specialty medical center with advanced facilities.",
        workingHours: "24 Hours",
        doctorsCount: 60,
        patientsCount: 5000,
        departments: ["Cardiology", "Neurology", "Orthopedics", "Pediatrics"],
        facilities: ["Emergency", "Pharmacy", "Radiology", "Ambulance"],
        latitude: 40.7128,
        longitude: -74.0060,
      ),

      HospitalModel(
        name: "Green Valley Hospital",
        address: "45 Green Valley Ave, Denver, CO",
        rating: 4.7,
        reviews: 176,
        distance: "4.0 km • 50 min",
        type: "Hospital",
        image: "assets/images/hospital4.png",
        phone: "+1 444 555 666",
        email: "support@greenvalley.com",
        website: "www.greenvalley.com",
        description: "Community hospital offering affordable healthcare services.",
        workingHours: "24 Hours",
        doctorsCount: 40,
        patientsCount: 3200,
        departments: ["General Medicine", "Orthopedics", "ENT"],
        facilities: ["Emergency", "Laboratory", "Parking"],
        latitude: 39.7392,
        longitude: -104.9903,
      ),

      HospitalModel(
        name: "Hopewell Medical Clinic",
        address: "890 Sunset Blvd, Miami, FL",
        rating: 4.6,
        reviews: 92,
        distance: "2.0 km • 30 min",
        type: "Clinic",
        image: "assets/images/hospital5.png",
        phone: "+1 777 888 999",
        email: "hello@hopewellclinic.com",
        website: "www.hopewellclinic.com",
        description: "Friendly neighborhood clinic with experienced doctors.",
        workingHours: "Mon - Sun | 8:00 AM - 9:00 PM",
        doctorsCount: 15,
        patientsCount: 1200,
        departments: ["General Medicine", "Dermatology"],
        facilities: ["Pharmacy", "Laboratory"],
        latitude: 25.7617,
        longitude: -80.1918,
      ),

      HospitalModel(
        name: "Northside Children’s Hospital",
        address: "210 Maple Street, Chicago, IL",
        rating: 4.9,
        reviews: 305,
        distance: "5.2 km • 1 hr",
        type: "Children Hospital",
        image: "assets/images/hospital6.png",
        phone: "+1 333 444 555",
        email: "info@northsidekids.com",
        website: "www.northsidekids.com",
        description: "Leading pediatric hospital dedicated to children's health.",
        workingHours: "24 Hours",
        doctorsCount: 50,
        patientsCount: 4500,
        departments: ["Pediatrics", "Child Neurology", "Child Cardiology"],
        facilities: ["Emergency", "ICU", "Ambulance", "Play Area"],
        latitude: 41.8781,
        longitude: -87.6298,
      ),
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
          //return _hospitalCard(hospitals[index]);
          return InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> HospitalDetailsScreen(hospital: hospitals[index],),
                  )
              );
            },
            child: _hospitalCard(hospitals[index]),
          );
        },
      ),
    );
  }

  // 🔹 Hospital Card
  Widget _hospitalCard(HospitalModel data) {
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
                  data.image,
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
                  data.name,
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
                        data.address,
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
                      data.rating.toString(),
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
                      "(${data.reviews})",
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
                      data.distance,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.local_hospital,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          data.type,
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
