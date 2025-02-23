import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'aritmatika.dart';
import 'tipeangka.dart';
import 'totalangka.dart';
import 'profil.dart';
import 'home_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black, // Background hitam
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1635776062127-d379bfcba9f8?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Welcome\n to Our Platform ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled, color: Colors.white),
              title: Text("Dashboard", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Profil", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.calculate, color: Colors.white),
              title: Text("Calculate", style: TextStyle(color: Colors.white)),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                ListTile(
                  leading: Icon(Icons.add, color: Colors.white),
                  title:
                      Text("Arithmetic", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArithmeticScreen()),
                    );
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.format_list_numbered, color: Colors.white),
                  title:
                      Text("Odd Even", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberTypeScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.summarize, color: Colors.white),
                  title:
                      Text("Summarize", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SumTotalScreen()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
