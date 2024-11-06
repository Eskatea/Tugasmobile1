import 'package:flutter/material.dart';
import 'package:tugasmobileflutter/MenuUtama/halamanutama.dart';
import 'package:tugasmobileflutter/MenuUtama/settingakun/kelolaakun.dart';
import 'package:tugasmobileflutter/login/loginscreen.dart';

class Menuakun extends StatefulWidget {
  const Menuakun({super.key});

  @override
  State<Menuakun> createState() => _MenuakunState();
}

class _MenuakunState extends State<Menuakun> {
  int _selectedIndex = 1; // Set ke 1 karena ini halaman Akun

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Halamanutama()),
        );
        break;
      case 1:
      // Sudah di halaman Akun
        break;
      case 2:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Apakah Anda yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Loginscreen()),
                    );
                  },
                  child: const Text('Ya'),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF7FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    // Single profile image
                    Container(
                      width: 120,  // Sesuaikan ukuran
                      height: 120,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Asal Universitas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Menu Items
              _buildMenuItem('Kelola Akun', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kelolaakun()),
                );
              }),
              _buildMenuItem('Notifikasi', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kelolaakun()),
                );
              }),
              _buildMenuItem('Privacy Policy', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kelolaakun()),
                );
              }),
              _buildMenuItem('Terms of Service', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kelolaakun()),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_bintang.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 0 ? Colors.purple : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_bintang.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? Colors.purple : Colors.black,
            ),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_bintang.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 2 ? Colors.purple : Colors.black,
            ),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF7FF),  // Warna pink/ungu muda
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
