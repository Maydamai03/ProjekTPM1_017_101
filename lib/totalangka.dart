import 'package:flutter/material.dart';
import 'customappbar.dart';
import 'customdrawer.dart';

class SumTotalScreen extends StatefulWidget {
  @override
  _SumTotalScreenState createState() => _SumTotalScreenState();
}

class _SumTotalScreenState extends State<SumTotalScreen> {
  final TextEditingController numbersController = TextEditingController();
  int total = 0;
  List<int> numbers = [];
  bool hasCalculated = false;

  void calculateTotal() {
    if (numbersController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Angka belum ada'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() {
        numbers = numbersController.text
            .split(',')
            .map((e) => int.parse(e.trim()))
            .toList();
        total = numbers.reduce((a, b) => a + b);
        hasCalculated = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tolong masukkan angka dan pisahkan dengan koma'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
            colors: [ const Color.fromARGB(255, 20, 13, 23),
              const Color.fromARGB(255, 44, 3, 68),
              const Color.fromARGB(255, 177, 75, 236)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: numbersController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            labelText: "Masukkan Angka (Pisahkan dengan koma)",
                            prefixIcon: Icon(Icons.format_list_numbered),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Contoh: 1, 2, 3, 4",
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "pisahkan dengan koma pliss><",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: calculateTotal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5, // Adds more shadow
                  ).copyWith(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors
                              .blue.shade900; // Darker color when pressed
                        }
                        if (states.contains(MaterialState.hovered)) {
                          return Colors
                              .blue.shade600; // Slightly lighter when hovered
                        }
                        return null;
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calculate_outlined,
                        size: 28, // Slightly larger icon
                        color: Colors.white, // Explicit white color
                      ),
                      SizedBox(width: 12), // Slightly more spacing
                      Text(
                        "Jumlah Total",
                        style: TextStyle(
                          fontSize: 20, // Larger font size
                          fontWeight: FontWeight.bold, // Bold text
                          letterSpacing: 1.2, // Spread letters slightly
                          color: Colors.white, // Explicit white color
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                if (hasCalculated)
                  Card(
                    elevation: 8,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Text(
                            "Hasil",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Numbers: ${numbers.join(' + ')}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total: ",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "$total",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildDrawerItem({
  //   required IconData icon,
  //   required String title,
  //   required VoidCallback onTap,
  //   Color color = Colors.white,
  //   double indent = 0,
  // }) {
  //   return ListTile(
  //     contentPadding: EdgeInsets.only(left: 16.0 + indent, right: 16.0),
  //     leading: Icon(icon, color: color),
  //     title: Text(title, style: TextStyle(color: color)),
  //     onTap: onTap,
  //   );
  // }
}
