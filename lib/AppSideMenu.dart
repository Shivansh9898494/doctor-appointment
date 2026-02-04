import 'package:flutter/material.dart';

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // 🔹 Header
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xff1E2A3A),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.local_hospital_outlined,
                      color: Color(0xff1E2A3A),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "HealthPal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Your health companion",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Menu Items
            _menuItem(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () => Navigator.pop(context),
            ),
            _menuItem(
              icon: Icons.person_outline,
              title: "My Profile",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.calendar_month_outlined,
              title: "Appointments",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.local_hospital_outlined,
              title: "Hospitals",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.favorite_outline,
              title: "Doctors",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),
            _menuItem(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {},
            ),

            const Spacer(),

            const Divider(),

            // 🔹 Logout
            _menuItem(
              icon: Icons.logout,
              title: "Logout",
              color: Colors.red,
              onTap: () {
                // handle logout
              },
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Menu Item
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = const Color(0xff1E2A3A),
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
