import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == "admin" &&
        _passwordController.text == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      _showLoginFailedDialog(); // Tampilkan popup jika login gagal
    }
  }

  // Fungsi untuk menampilkan popup login gagal
  void _showLoginFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Gagal"),
          content: Text("Username atau password salah!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup popup
              },
              child: Text("Kembali"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 20, 13, 23),
              const Color.fromARGB(255, 44, 3, 68),
              const Color.fromARGB(255, 177, 75, 236)
            ],
          ),
        ),
        child: Center(
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255), // Warna Card
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: 300, // Lebar kotak login
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(
                                255, 52, 1, 61)), // Warna label (placeholder)
                        filled: true, // Aktifkan latar belakang
                        fillColor: const Color.fromARGB(255, 238, 238,
                            238), // Warna latar belakang TextField
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(
                                255, 52, 1, 61)), // Warna label (placeholder)
                        filled: true, // Aktifkan latar belakang
                        fillColor: const Color.fromARGB(255, 238, 238,
                            238), // Warna latar belakang TextField
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 84, 24, 92), // Warna background tombol
                        foregroundColor: const Color.fromARGB(
                            255, 255, 255, 255), // Warna teks tombol
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 14, // Ukuran font
                          fontWeight: FontWeight.bold, // Membuat teks bold
                          // fontFamily:
                          //     "Roboto", // Mengubah font (opsional, pastikan font ada di proyek)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
