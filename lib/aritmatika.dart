import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'customappbar.dart';
import 'customdrawer.dart';

class ArithmeticScreen extends StatefulWidget {
  @override
  _ArithmeticScreenState createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0;
  String operation = '';

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void calculate(String op) {
    String num1Text = num1Controller.text.trim();
    String num2Text = num2Controller.text.trim();

    if (num1Text.isEmpty || num2Text.isEmpty) {
      _showSnackbar('Harap masukkan kedua angka!', Colors.red);
      return;
    }

    double? num1 = double.tryParse(num1Text);
    double? num2 = double.tryParse(num2Text);

    if (num1 == null || num2 == null) {
      _showSnackbar('Input harus berupa angka yang valid!', Colors.orange);
      return;
    }

    setState(() {
      operation = op;
      if (op == '+') {
        result = num1 + num2;
      } else if (op == '-') {
        result = num1 - num2;
      }
    });

    //_showSnackbar('Perhitungan berhasil!', Colors.green);
  }

  String formatResult(double value) {
    // Jika nilai adalah integer (tidak ada desimal), tampilkan sebagai integer
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    // Jika nilai memiliki desimal, tampilkan hingga 2 digit desimal
    return value.toStringAsFixed(2);
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
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: num1Controller,
                          label: "First Number",
                          prefix: Icons.looks_one,
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          controller: num2Controller,
                          label: "Second Number",
                          prefix: Icons.looks_two,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOperationButton(
                      onPressed: () => calculate('+'),
                      icon: Icons.add,
                      label: "Tambah",
                      color: const Color.fromARGB(255, 90, 255, 225),
                    ),
                    _buildOperationButton(
                      onPressed: () => calculate('-'),
                      icon: Icons.remove,
                      label: "Kurang",
                      color: const Color.fromARGB(255, 255, 138, 237),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                if (operation.isNotEmpty)
                  Card(
                    elevation: 8,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          Text(
                            "Result",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${num1Controller.text} $operation ${num2Controller.text} = ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    formatResult(result),
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          )
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        counterText: 'Maks. 15 digit',
        counterStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildOperationButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          shadowColor: color.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}