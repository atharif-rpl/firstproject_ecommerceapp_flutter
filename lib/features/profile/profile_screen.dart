import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang halaman menjadi gelap
      backgroundColor: const Color(0xFF393939),
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0, // Menghilangkan bayangan app bar
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white, // Mengubah warna ikon dan judul menjadi putih
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          const SizedBox(height: 20),

          // --- Bagian Info Profil Utama ---
          _buildProfileHeader(),

          const SizedBox(height: 40),

          // --- Bagian Menu Pilihan ---
          _buildProfileMenu(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {
              // Tambahkan logika navigasi di sini
            },
          ),
          _buildProfileMenu(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),
          _buildProfileMenu(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildProfileMenu(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),

          Divider(height: 40, color: Colors.grey[700]), // Mengubah warna divider

          // --- Tombol Log Out ---
          _buildProfileMenu(
            icon: Icons.logout,
            title: 'Log Out',
            textColor: Colors.red, // Warna khusus untuk logout
            onTap: () {
              // Tambahkan logika logout di sini
            },
          ),
        ],
      ),
    );
  }

  // Widget untuk bagian header profil (foto, nama, email)
  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage:
          AssetImage('assets/images/profile.png'), // Ganti dengan path gambar Anda
        ),
        const SizedBox(height: 16),
        const Text(
          'Atharif Pratama Budiman', // Ganti dengan nama pengguna
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Mengubah warna teks menjadi putih
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'atha55733@gmail.com', // Ganti dengan email pengguna
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[400], // Mengubah warna teks menjadi abu-abu terang
          ),
        ),
      ],
    );
  }

  // Widget template untuk setiap baris menu
  Widget _buildProfileMenu({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.white, // Mengubah warna default menjadi putih
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing:
      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]), // Mengubah warna ikon panah
      onTap: onTap,
    );
  }
}
