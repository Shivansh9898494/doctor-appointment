import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProfile {
  final String name;
  final String phone;
  final String imageUrl;

  UserProfile({
    required this.name,
    required this.phone,
    required this.imageUrl,
  });
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Daniel Martinez";
  String phone = "+123 856479683";
  String image =
      "https://i.pravatar.cc/300"; // demo image

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? name;
      phone = prefs.getString("phone") ?? phone;
      image = prefs.getString("image") ?? image;
    });
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("phone", phone);
    await prefs.setString("image", image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(image),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xff1C2A3A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            phone,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          _menuItem(Icons.person_outline, "Edit Profile"),
          _menuItem(Icons.favorite_border, "Favorite"),
          _menuItem(Icons.notifications_none, "Notifications"),
          _menuItem(Icons.settings_outlined, "Settings"),
          _menuItem(Icons.help_outline, "Help and Support"),
          _menuItem(Icons.description_outlined, "Terms and Conditions"),
          _menuItem(Icons.logout, "Log Out", isLogout: true),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, {bool isLogout = false}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
          title: Text(
            title,
            style: TextStyle(
              color: isLogout ? Colors.red : Colors.black,
              fontSize: 15,
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (title == "Log Out") {
              // clear persisted data if needed
            }
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
