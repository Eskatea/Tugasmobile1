import 'package:flutter/material.dart';
import 'package:tugasmobileflutter/login/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Fungsi untuk navigasi otomatis setelah 5 detik
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()), // Ganti HomeScreen ke halaman utama
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan warna background
      body: Center(
        child: Image.asset(
          'assets/images/logo_tugas_responsi2.png',
          width: 252, // Sesuaikan ukuran gambar
          height: 96, // Sesuaikan ukuran gambar
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
