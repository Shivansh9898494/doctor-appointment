import 'package:doctor_appointment/Models/DoctorModel.dart';
import 'package:flutter/material.dart';
import 'doctor_details_screen.dart';

class AllDoctorsScreen extends StatefulWidget {
  final String category; // 👈 received from previous screen

  const AllDoctorsScreen({
    super.key,
    required this.category,
  });

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}


class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category; // 👈 SET DEFAULT
  }

  final List<String> categories = [
    "All",
    "Cardiologist",
    "Gynecologist",
    "Orthopedic",
    "Pediatrician",
    "Pulmonologist",
    "General Physician",
    "Ophthalmologist",
    "Neurologist",
    "Pediatrician",
    "Dentist",
  ];

  final List<Doctor> allDoctors = [
    Doctor(
      name: "Dr. David Patel",
      specialization: "Cardiologist",
      type: "Cardiologist",
      hospital: "Golden Cardiology Center",
      image: "assets/images/doctor1.png",
      patients: "2,000+",
      experience: "10+",
      rating: "5",
      reviews: "1,872",
      workingTime: "Mon - Fri, 08:00 AM - 06:00 PM",
      about:
      "Dr. David Patel is a dedicated cardiologist with over 10 years of experience providing excellent heart care.",
    ),

    Doctor(
      name: "Dr. Jessica Turner",
      specialization: "Gynecologist",
      type: "Gynecologist",
      hospital: "Women Care Clinic",
      image: "assets/images/doctor2.png",
      patients: "1,500+",
      experience: "8+",
      rating: "4.9",
      reviews: "1,020",
      workingTime: "Mon - Sat, 09:00 AM - 05:00 PM",
      about:
      "Dr. Jessica specializes in women's health and has helped thousands of patients with compassionate care.",
    ),

    Doctor(
      name: "Dr. Michael Johnson",
      specialization: "Orthopedic",
      type: "Orthopedic",
      hospital: "Bone & Joint Hospital",
      image: "assets/images/doctor3.png",
      patients: "3,200+",
      experience: "12+",
      rating: "4.8",
      reviews: "2,450",
      workingTime: "Mon - Fri, 10:00 AM - 06:00 PM",
      about:
      "Dr. Michael Johnson is an orthopedic expert focusing on joint replacement and sports injuries.",
    ),

    Doctor(
      name: "Dr. Emily Walker",
      specialization: "Pediatrician",
      type: "Pediatrician",
      hospital: "Happy Kids Hospital",
      image: "assets/images/doctor4.png",
      patients: "1,800+",
      experience: "9+",
      rating: "5",
      reviews: "1,100",
      workingTime: "Mon - Sat, 09:00 AM - 04:00 PM",
      about:
      "Dr. Emily Walker is a child specialist known for her friendly approach and accurate diagnosis.",
    ),

    Doctor(
      name: "Dr. Robert Singh",
      specialization: "Pulmonologist",
      type: "Pulmonologist",
      hospital: "Breathe Well Lung Center",
      image: "assets/images/doctor5.png",
      patients: "2,300+",
      experience: "11+",
      rating: "4.7",
      reviews: "1,560",
      workingTime: "Mon - Fri, 09:00 AM - 05:30 PM",
      about:
      "Dr. Robert Singh is a pulmonologist specializing in asthma, COPD, and respiratory infections.",
    ),

    Doctor(
      name: "Dr. Ananya Sharma",
      specialization: "General Physician",
      type: "General Physician",
      hospital: "City Health Clinic",
      image: "assets/images/doctor6.png",
      patients: "4,500+",
      experience: "15+",
      rating: "4.9",
      reviews: "3,200",
      workingTime: "Mon - Sat, 08:30 AM - 07:00 PM",
      about:
      "Dr. Ananya Sharma is a trusted general physician known for accurate diagnosis and patient-friendly care.",
    ),

    Doctor(
      name: "Dr. Vikram Mehta",
      specialization: "Ophthalmologist",
      type: "Ophthalmologist",
      hospital: "Vision Plus Eye Hospital",
      image: "assets/images/doctor7.png",
      patients: "2,800+",
      experience: "13+",
      rating: "4.8",
      reviews: "1,940",
      workingTime: "Mon - Fri, 09:00 AM - 06:00 PM",
      about:
      "Dr. Vikram Mehta specializes in cataract surgery, LASIK, and advanced eye care treatments.",
    ),

    Doctor(
      name: "Dr. Neha Kapoor",
      specialization: "Neurologist",
      type: "Neurologist",
      hospital: "Brain & Spine Institute",
      image: "assets/images/doctor8.png",
      patients: "1,600+",
      experience: "10+",
      rating: "4.9",
      reviews: "1,210",
      workingTime: "Mon - Sat, 10:00 AM - 05:00 PM",
      about:
      "Dr. Neha Kapoor is an expert neurologist treating migraines, epilepsy, and nervous system disorders.",
    ),

    Doctor(
      name: "Dr. Arjun Verma",
      specialization: "Dentist",
      type: "Dentist",
      hospital: "Smile Bright Dental Care",
      image: "assets/images/doctor9.png",
      patients: "3,700+",
      experience: "14+",
      rating: "5",
      reviews: "2,980",
      workingTime: "Mon - Sat, 09:00 AM - 08:00 PM",
      about:
      "Dr. Arjun Verma is a cosmetic and general dentist offering painless treatments and modern dental solutions.",
    ),
    // ================= EXTRA DOCTORS =================

    Doctor(
      name: "Dr. Rakesh Malhotra",
      specialization: "Cardiologist",
      type: "Cardiologist",
      hospital: "Heart Care Hospital",
      image: "assets/images/doctor10.png",
      patients: "5,000+",
      experience: "18+",
      rating: "4.9",
      reviews: "3,450",
      workingTime: "Mon - Fri, 09:00 AM - 06:00 PM",
      about:
      "Dr. Rakesh Malhotra is a senior cardiologist specializing in interventional cardiology and heart failure.",
    ),

    Doctor(
      name: "Dr. Pooja Nair",
      specialization: "Gynecologist",
      type: "Gynecologist",
      hospital: "Mother & Women Clinic",
      image: "assets/images/doctor1.png",
      patients: "2,200+",
      experience: "9+",
      rating: "4.8",
      reviews: "1,430",
      workingTime: "Mon - Sat, 10:00 AM - 05:00 PM",
      about:
      "Dr. Pooja Nair provides expert care in pregnancy, infertility, and women’s reproductive health.",
    ),

    Doctor(
      name: "Dr. Kunal Arora",
      specialization: "Orthopedic",
      type: "Orthopedic",
      hospital: "Advanced Ortho Care",
      image: "assets/images/doctor2.png",
      patients: "3,900+",
      experience: "14+",
      rating: "4.7",
      reviews: "2,110",
      workingTime: "Mon - Fri, 09:30 AM - 06:30 PM",
      about:
      "Dr. Kunal Arora specializes in knee replacement, fractures, and sports-related injuries.",
    ),

    Doctor(
      name: "Dr. Sneha Joshi",
      specialization: "Pediatrician",
      type: "Pediatrician",
      hospital: "Little Angels Hospital",
      image: "assets/images/doctor3.png",
      patients: "2,700+",
      experience: "11+",
      rating: "5",
      reviews: "1,980",
      workingTime: "Mon - Sat, 09:00 AM - 04:30 PM",
      about:
      "Dr. Sneha Joshi is loved by children for her gentle care and precise pediatric diagnosis.",
    ),

    Doctor(
      name: "Dr. Aman Khan",
      specialization: "Pulmonologist",
      type: "Pulmonologist",
      hospital: "Lung Health Institute",
      image: "assets/images/doctor4.png",
      patients: "1,900+",
      experience: "10+",
      rating: "4.6",
      reviews: "1,120",
      workingTime: "Mon - Fri, 10:00 AM - 06:00 PM",
      about:
      "Dr. Aman Khan focuses on asthma management, sleep apnea, and chronic lung diseases.",
    ),

    Doctor(
      name: "Dr. Kavita Rao",
      specialization: "General Physician",
      type: "General Physician",
      hospital: "Family Care Clinic",
      image: "assets/images/doctor5.png",
      patients: "6,200+",
      experience: "20+",
      rating: "5",
      reviews: "4,010",
      workingTime: "Mon - Sat, 08:00 AM - 07:00 PM",
      about:
      "Dr. Kavita Rao is a highly experienced family doctor providing holistic primary healthcare.",
    ),

    Doctor(
      name: "Dr. Sandeep Chawla",
      specialization: "Neurologist",
      type: "Neurologist",
      hospital: "NeuroLife Hospital",
      image: "assets/images/doctor6.png",
      patients: "2,100+",
      experience: "12+",
      rating: "4.8",
      reviews: "1,540",
      workingTime: "Mon - Fri, 10:00 AM - 05:00 PM",
      about:
      "Dr. Sandeep Chawla treats stroke, epilepsy, Parkinson’s, and complex neurological disorders.",
    ),

    Doctor(
      name: "Dr. Mehul Jain",
      specialization: "Dentist",
      type: "Dentist",
      hospital: "Perfect Smile Dental",
      image: "assets/images/doctor7.png",
      patients: "4,800+",
      experience: "16+",
      rating: "4.9",
      reviews: "3,600",
      workingTime: "Mon - Sat, 09:00 AM - 08:30 PM",
      about:
      "Dr. Mehul Jain is an expert in cosmetic dentistry, implants, and painless root canal treatments.",
    ),

    Doctor(
      name: "Dr. Alok Mishra",
      specialization: "Orthopedic",
      type: "Orthopedic",
      hospital: "Joint Plus Hospital",
      image: "assets/images/doctor8.png",
      patients: "2,600+",
      experience: "11+",
      rating: "4.7",
      reviews: "1,730",
      workingTime: "Mon - Fri, 09:00 AM - 06:00 PM",
      about:
      "Dr. Alok Mishra focuses on spine care, arthritis management, and minimally invasive surgery.",
    ),

    Doctor(
      name: "Dr. Ritu Saxena",
      specialization: "Ophthalmologist",
      type: "Ophthalmologist",
      hospital: "Clear Vision Eye Center",
      image: "assets/images/doctor9.png",
      patients: "3,300+",
      experience: "13+",
      rating: "4.9",
      reviews: "2,280",
      workingTime: "Mon - Sat, 09:30 AM - 05:30 PM",
      about:
      "Dr. Ritu Saxena specializes in LASIK, cataract surgery, and pediatric ophthalmology.",
    ),

    Doctor(
      name: "Dr. Nikhil Bansal",
      specialization: "Cardiologist",
      type: "Cardiologist",
      hospital: "City Heart Institute",
      image: "assets/images/doctor10.png",
      patients: "4,400+",
      experience: "15+",
      rating: "4.8",
      reviews: "3,100",
      workingTime: "Mon - Fri, 08:30 AM - 06:00 PM",
      about:
      "Dr. Nikhil Bansal provides advanced cardiac treatments and preventive heart care.",
    ),

    Doctor(
      name: "Dr. Swati Kulkarni",
      specialization: "Gynecologist",
      type: "Gynecologist",
      hospital: "Care Women Hospital",
      image: "assets/images/doctor1.png",
      patients: "2,800+",
      experience: "12+",
      rating: "4.9",
      reviews: "1,990",
      workingTime: "Mon - Sat, 09:00 AM - 05:00 PM",
      about:
      "Dr. Swati Kulkarni is known for high-risk pregnancy management and fertility treatments.",
    ),

    Doctor(
      name: "Dr. Harish Iyer",
      specialization: "Pulmonologist",
      type: "Pulmonologist",
      hospital: "Respira Care Center",
      image: "assets/images/doctor2.png",
      patients: "1,700+",
      experience: "9+",
      rating: "4.6",
      reviews: "980",
      workingTime: "Mon - Fri, 10:00 AM - 05:00 PM",
      about:
      "Dr. Harish Iyer helps patients recover from chronic respiratory and lung-related conditions.",
    ),

    Doctor(
      name: "Dr. Tanya Mehra",
      specialization: "Pediatrician",
      type: "Pediatrician",
      hospital: "Sunshine Kids Clinic",
      image: "assets/images/doctor3.png",
      patients: "2,400+",
      experience: "10+",
      rating: "5",
      reviews: "1,860",
      workingTime: "Mon - Sat, 09:00 AM - 04:00 PM",
      about:
      "Dr. Tanya Mehra ensures comprehensive healthcare for infants, toddlers, and adolescents.",
    ),

    Doctor(
      name: "Dr. Rohit Kuldeep",
      specialization: "General Physician",
      type: "General Physician",
      hospital: "Prime Health Center",
      image: "assets/images/doctor4.png",
      patients: "5,100+",
      experience: "17+",
      rating: "4.8",
      reviews: "3,540",
      workingTime: "Mon - Sat, 08:00 AM - 07:00 PM",
      about:
      "Dr. Rohit Kuldeep provides trusted primary care with a focus on preventive medicine.",
    ),

    Doctor(
      name: "Dr. Sunita Deshmukh",
      specialization: "Neurologist",
      type: "Neurologist",
      hospital: "MindCare Neuro Hospital",
      image: "assets/images/doctor5.png",
      patients: "1,500+",
      experience: "11+",
      rating: "4.7",
      reviews: "1,130",
      workingTime: "Mon - Fri, 10:00 AM - 05:00 PM",
      about:
      "Dr. Sunita Deshmukh treats neurological disorders with a patient-first approach.",
    ),

    Doctor(
      name: "Dr. Akash Verma",
      specialization: "Dentist",
      type: "Dentist",
      hospital: "Elite Dental Studio",
      image: "assets/images/doctor6.png",
      patients: "3,900+",
      experience: "13+",
      rating: "5",
      reviews: "2,870",
      workingTime: "Mon - Sat, 09:00 AM - 08:00 PM",
      about:
      "Dr. Akash Verma offers advanced cosmetic dentistry and smile makeover treatments.",
    ),

    Doctor(
      name: "Dr. Manish Kapoor",
      specialization: "Orthopedic",
      type: "Orthopedic",
      hospital: "Spine & Bone Care",
      image: "assets/images/doctor7.png",
      patients: "2,900+",
      experience: "14+",
      rating: "4.8",
      reviews: "2,060",
      workingTime: "Mon - Fri, 09:00 AM - 06:00 PM",
      about:
      "Dr. Manish Kapoor is known for complex spine surgeries and fracture management.",
    ),

    Doctor(
      name: "Dr. Isha Malviya",
      specialization: "Ophthalmologist",
      type: "Ophthalmologist",
      hospital: "EyePlus Hospital",
      image: "assets/images/doctor8.png",
      patients: "2,200+",
      experience: "10+",
      rating: "4.9",
      reviews: "1,640",
      workingTime: "Mon - Sat, 09:00 AM - 05:30 PM",
      about:
      "Dr. Isha Malviya specializes in retinal care, cataract surgery, and vision correction.",
    ),

  ];


  List<Doctor> get filteredDoctors {
    if (selectedCategory == "All") return allDoctors;
    return allDoctors
        .where((d) => d.type == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Doctors",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _categoryFilters(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (_, i) =>
                    _doctorCard(context, filteredDoctors[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((c) {
          final selected = selectedCategory == c;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(c),
              selected: selected,
              selectedColor: Colors.black,
              backgroundColor: Colors.white,
              labelStyle:
              TextStyle(color: selected ? Colors.white : Colors.black),
              onSelected: (_) => setState(() => selectedCategory = c),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _doctorCard(BuildContext context, Doctor doctor) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DoctorDetailsScreen(doctor: doctor),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                doctor.image,
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(doctor.specialization,
                      style:
                      const TextStyle(color: Colors.blue, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(doctor.hospital,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(doctor.rating,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 6),
                      Text("${doctor.reviews} Reviews",
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
