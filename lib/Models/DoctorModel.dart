class Doctor {
  final String name;
  final String specialization;
  final String hospital;
  final String image;
  final String about;
  final String workingTime;
  final String patients;
  final String experience;
  final String rating;
  final String reviews;
  final String type;

  Doctor({
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.image,
    required this.about,
    required this.workingTime,
    required this.patients,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.type,
  });

  // ✅ From JSON (API → App)
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      hospital: json['hospital'] ?? '',
      image: json['image'] ?? '',
      about: json['about'] ?? '',
      workingTime: json['working_time'] ?? '',
      patients: json['patients'] ?? '',
      experience: json['experience'] ?? '',
      rating: json['rating'] ?? '',
      reviews: json['reviews'] ?? '', type: '',
    );
  }

  // ✅ To JSON (App → API)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialization': specialization,
      'hospital': hospital,
      'image': image,
      'about': about,
      'working_time': workingTime,
      'patients': patients,
      'experience': experience,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
