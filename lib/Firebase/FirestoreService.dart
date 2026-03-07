import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/AppointmentModel.dart';
import '../Models/UserModel.dart';

class FirestoreService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🔹 Fetch Users
  Future<List<UserModel>> fetchUsers() async {

    try {

      QuerySnapshot snapshot =
      await _firestore.collection('users').get();

      List<UserModel> users = snapshot.docs.map((doc) {

        Map<String, dynamic> data =
        doc.data() as Map<String, dynamic>;

        return UserModel.fromMap(data);

      }).toList();

      return users;

    } catch (e) {

      print("Firestore Error: $e");
      return [];

    }
  }

  /// 🔹 Add User
  Future<void> addUser(UserModel user) async {

    await _firestore.collection('users').add(
      user.toMap(),
    );

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
