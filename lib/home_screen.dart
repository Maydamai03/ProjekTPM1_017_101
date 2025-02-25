import 'package:flutter/material.dart';
import 'customappbar.dart';
import 'customdrawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "MayAPP"),
      drawer: CustomDrawer(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Mulai dari atas
          children: [
            SizedBox(height: 50),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Gambar latar belakang
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20), // Atur margin kiri dan kanan
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1558350283-8269d86681f2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.5), // Background transparan
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "WELCOME, to OUR DASHBOARD",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Divider(
              color: Colors.grey,
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
