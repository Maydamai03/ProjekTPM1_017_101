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
  int numberCount = 0;
  int digitCount = 0;
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
        numberCount = numbers.length;
        
        // Menghitung jumlah digit dari semua angka
        digitCount = 0;
        for (int number in numbers) {
          // Jika angka negatif, kita hanya hitung digit tanpa tanda minus
          String numStr = number.abs().toString();
          digitCount += numStr.length;
        }
        
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
            colors: [
              const Color.fromARGB(255, 20, 13, 23),
              const Color.fromARGB(255, 44, 3, 68),
              const Color.fromARGB(255, 177, 75, 236)
            ],
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
                    elevation: 5,
                  ).copyWith(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue.shade900;
                        }
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.shade600;
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
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Jumlah Total",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white,
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
                            "Numbers: ${numbers.length > 5 ? numbers.take(5).join(' + ') + ' ...' : numbers.join(' + ')}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          SizedBox(height: 10),
                          _buildResultRow("Total :", "$total", Colors.blue.shade700),
                          SizedBox(height: 5),
                          _buildResultRow("Jumlah Angka:", "$numberCount", Colors.green.shade700),
                          SizedBox(height: 5),
                          _buildResultRow("Jumlah Digit:", "$digitCount", Colors.purple.shade700),
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
  
  Widget _buildResultRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: valueColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}