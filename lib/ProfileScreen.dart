import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String username = "";
  String email = "";
  String password = "";
  String gender = "";
  String dob = "";
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("username") ?? "User Name";
      email = prefs.getString("email") ?? "example@email.com";
      password = prefs.getString("password") ?? "********";
      gender = prefs.getString("gender") ?? "Not Selected";
      dob = prefs.getString("dateOfBirth") ?? "Not Selected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            /// Profile Avatar
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 3),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffE8ECF4),
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              username,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            /// Profile Info Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 4),
                  )
                ],
              ),

              child: Column(
                children: [

                  _profileTile(Icons.person_outline, "Username", username),

                  _divider(),

                  _profileTile(Icons.email_outlined, "Email", email),

                  _divider(),

                 // _profileTile(Icons.lock_outline, "Password", "********"),

                  ListTile(
                    leading: const Icon(
                      Icons.lock_outline,
                      color: Color(0xff1C2A3A),
                    ),
                    title: const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: Text(
                      _showPassword ? password : "********",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xff1C2A3A),
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),

                  _divider(),

                  _profileTile(Icons.person_2_outlined, "Gender", gender),

                  _divider(),

                  _profileTile(Icons.cake_outlined, "Date of Birth", dob),

                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Edit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1C2A3A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff1C2A3A)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade200,
      indent: 20,
      endIndent: 20,
    );
  }
}


/*import 'package:flutter/material.dart';
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
}*/
