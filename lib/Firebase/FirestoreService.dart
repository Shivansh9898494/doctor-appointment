import 'package:cloud_firestore/cloud_firestore.dart';
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

}