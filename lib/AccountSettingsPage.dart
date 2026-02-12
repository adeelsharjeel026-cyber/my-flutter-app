import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 Sirf Title, koi back button ya navbar nahi
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // 👈 back arrow hata diya
        title: const Text(
          "Account Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // 🔹 Body
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SettingsItem(icon: Icons.person_outline, title: "Profile"),
          Divider(color: Colors.grey.shade300, height: 1),
          SettingsItem(icon: Icons.notifications_none, title: "Notifications"),
          Divider(color: Colors.grey.shade300, height: 1),
          SettingsItem(
            icon: Icons.remove_red_eye_outlined,
            title: "Appearance",
          ),
          Divider(color: Colors.grey.shade300, height: 1),
          SettingsItem(icon: Icons.lock_outline, title: "Privacy & Security"),
          Divider(color: Colors.grey.shade300, height: 1),
          SettingsItem(icon: Icons.info_outline, title: "Help and Support"),
          Divider(color: Colors.grey.shade300, height: 1),
          SettingsItem(icon: Icons.help_outline, title: "About"),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: InkWell(
        onTap: () {
          // Add navigation logic here
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
