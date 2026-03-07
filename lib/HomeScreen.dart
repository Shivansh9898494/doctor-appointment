import 'package:doctor_appointment/AllDoctorScreen.dart';
import 'package:doctor_appointment/AllHospitalScreen.dart';
import 'package:doctor_appointment/AppSideMenu.dart';
import 'package:doctor_appointment/HospitalDetailScreen.dart' show HospitalDetailsScreen;
import 'package:flutter/material.dart';

import 'Models/HospitalModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Map<String, String>> banners = [
    {
      "title": "Looking for\nSpecialist Doctors?",
      "subtitle": "Schedule an appointment\nwith our top doctors.",
      "image":
      "assets/images/doctor1.png",
    },
    {
      "title": "Book Online\nMedical Consultation",
      "subtitle": "Expert doctors available anytime.",
      "image":
      "assets/images/doctor5.png",
    },
    {
      "title": "Trusted Health\nProfessionals",
      "subtitle": "Verified doctors near you.",
      "image":
      "assets/images/doctor7.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      _currentIndex = (_currentIndex + 1) % banners.length;

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      _autoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const AppSideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(),
              const SizedBox(height: 16),
              _searchBar(),
              const SizedBox(height: 16),
              _promoBanner(),
              const SizedBox(height: 24),
              _DoctorHeader("Categories"),
              const SizedBox(height: 12),
              _categories(context),
              const SizedBox(height: 24),
              _HospitalHeader("Nearby Medical Centers"),
              const SizedBox(height: 12),
              _medicalCenters(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Top Bar
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Location", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(
                  "Indore, India",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                //Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),

        CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              }, icon: Icon(Icons.menu),)
        ),
      ],
    );
  }

  // 🔹 Search
  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search doctor...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 🔹 Promo Banner
  Widget _promoBanner() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (_, index) {
              final item = banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xff4C9F9B), Color(0xff3B7C7A)],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item["subtitle"]!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(item["image"]!),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: _currentIndex == index ? 18 : 6,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? const Color(0xff3B7C7A)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 🔹 Section Header
  Widget _DoctorHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  AllDoctorsScreen(category: 'All',)),
            );
          },
          child: const Text(
            "See All",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ],
    );
  }
  // 🔹 Section Header
  Widget _HospitalHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  HospitalListScreen()),
            );
          },
          child: const Text(
            "See All",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ],
    );
  }
  // 🔹 Categories
  Widget _categories(BuildContext context) {
    final categories = [
      {
        "icon": Icons.medical_services,
        "name": "Dentist",
        "color": Colors.pink.shade100,
      },
      {
        "icon": Icons.favorite,
        "name": "Cardiologist",
        "color": Colors.red.shade100,
      },
      {
        "icon": Icons.air,
        "name": "Pulmonologist",
        "color": Colors.orange.shade100,
      },
      {
        "icon": Icons.healing,
        "name": "General Physician",
        "color": Colors.deepPurple.shade100,
      },
      {
        "icon": Icons.visibility,
        "name": "Ophthalmologist",
        "color": Colors.blue.shade100,
      },
      {
        "icon": Icons.psychology,
        "name": "Neurologist",
        "color": Colors.green.shade100,
      },
      {
        "icon": Icons.child_care,
        "name": "Pediatrician",
        "color": Colors.teal.shade100,
      },
      {
        "icon": Icons.female,
        "name": "Gynecologist",
        "color": Colors.pinkAccent.shade100,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (_, index) {
        final category = categories[index];

        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AllDoctorsScreen(
                  category: category["name"] as String, // 👈 pass category
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: category["color"] as Color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  category["icon"] as IconData,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category["name"] as String,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }


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
  ];


  // 🔹 Medical Centers
  Widget _medicalCenters() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hospitals.length,
        itemBuilder: (_, index){
          //return _medicalCard(hospitals[index].name, hospitals[index].image);
          return InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> HospitalDetailsScreen(hospital: hospitals[index],),
                  ),
              );
            },
            child: _medicalCard(hospitals[index].name, hospitals[index].image),
          );
        },
      ),
    );
  }

  Widget _medicalCard(String title, String image) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),

    );
  }
}
