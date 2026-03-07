class HospitalModel {
  final String name;
  final String address;
  final double rating;
  final int reviews;
  final String distance;
  final String type;
  final String image;
  // Additional Details
  final String phone;
  final String email;
  final String website;
  final String description;
  final String workingHours;
  final int doctorsCount;
  final int patientsCount;
  final List<String> departments;
  final List<String> facilities;
  final double latitude;
  final double longitude;

  HospitalModel({
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.type,
    required this.image,
    required this.phone,
    required this.email,
    required this.website,
    required this.description,
    required this.workingHours,
    required this.doctorsCount,
    required this.patientsCount,
    required this.departments,
    required this.facilities,
    required this.latitude,
    required this.longitude,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      name: json['name'],
      address: json['address'],
      rating: double.parse(json['rating'].toString()),
      reviews: int.parse(json['reviews'].toString()),
      distance: json['distance'],
      type: json['type'],
      image: json['image'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      description: json['description'],
      workingHours: json['workingHours'],
      doctorsCount: json['doctorsCount'],
      patientsCount: json['patientsCount'],
      departments: List<String>.from(json['departments']),
      facilities: List<String>.from(json['facilities']),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}