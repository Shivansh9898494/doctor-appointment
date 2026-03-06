import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/AppointmentModel.dart';
import '../Models/UserModel.dart';

class FirestoreService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> fetchUsers() async {

    try {

      QuerySnapshot snapshot =
      await _firestore.collection('userid').get();

      print("Total docs: ${snapshot.docs.length}");

      List<UserModel> users = snapshot.docs.map((doc) {

        Map<String, dynamic> data =
        doc.data() as Map<String, dynamic>;

        print("Doc Data: $data");

        return UserModel.fromMap(data);

      }).toList();

      return users;

    } catch (e) {

      print("Firestore Error: $e");
      return [];

    }
  }

  // 🔹 Add new user
  Future<void> addUser(String username, String password) async {
    await _firestore.collection('userid').add({
      "username": username,
      "password": password,
    });
  }


  Future<List<AppointmentModel>> fetchAppointment() async {
    try {

      QuerySnapshot snapshot =
      await _firestore.collection('appointment').get();

      print("Total docs: ${snapshot.docs.length}");

      List<AppointmentModel> appointment = snapshot.docs.map((doc) {

        Map<String, dynamic> data =
        doc.data() as Map<String, dynamic>;

        print("Doc Data: $data");

        return AppointmentModel.fromMap(data);

      }).toList();

      return appointment;

    } catch (e) {

      print("Firestore Error: $e");
      return [];

    }
  }

  Future<void> addAppointment(AppointmentModel detail) async {
    await _firestore.collection('appointment').add({
      "Uname": detail.Uname,
      "Dname": detail.Dname,
      "time": detail.time,
      "date": detail.date,
      "month": detail.month,
      "year": detail.year,
      "doctor": detail.doctor?.toJson(),
    });
  }

}