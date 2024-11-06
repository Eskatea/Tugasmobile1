import 'package:flutter/material.dart';
import 'package:tugasmobileflutter/MenuUtama/halamanutama.dart';
import 'package:tugasmobileflutter/MenuUtama/menuakun.dart';
import 'package:tugasmobileflutter/login/loginscreen.dart';

class Kelolaakun extends StatefulWidget {
  const Kelolaakun({super.key});

  @override
  State<Kelolaakun> createState() => _KelolaakunState();
}

class _KelolaakunState extends State<Kelolaakun> {

  int _selectedIndex = 0;

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
      // Navigasi ke halaman Akun
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Menuakun()),
        );
        break;
      case 2 :
      // Navigasi ke Logout
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Apakah Anda yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog
                  },
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    // Tambahkan logic logout di sini jika perlu
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
  // Text controllers
  final _emailController = TextEditingController();
  final _namaController = TextEditingController();
  final _teleponController = TextEditingController();
  final _alamatController = TextEditingController();

  // Buat InputDecoration yang bisa digunakan ulang
  final _inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.blue),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF7FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
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
              ),

              const SizedBox(height: 24),

              // Form Fields
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: _emailController,
                  decoration: _inputDecoration,
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Nama',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: _namaController,
                  decoration: _inputDecoration,
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Nomor Telepon',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: _teleponController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration,
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _alamatController,
                maxLines: 3,
                decoration: _inputDecoration,
              ),
              const SizedBox(height: 24),

              // Ubah Profil Button
              Center(
              child: SizedBox(
                width: 128,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Ubah Profil',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              )
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

  @override
  void dispose() {
    _emailController.dispose();
    _namaController.dispose();
    _teleponController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}
