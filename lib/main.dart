import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Operaciones Matemáticas',
      home: MathOperationsApp(),
    );
  }
}

class MathOperationsApp extends StatefulWidget {
  @override
  _MathOperationsAppState createState() => _MathOperationsAppState();
}

class _MathOperationsAppState extends State<MathOperationsApp> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();

  String result = "";

  void findMax() {
    try {
      double num1 = double.parse(num1Controller.text);
      double num2 = double.parse(num2Controller.text);
      double num3 = double.parse(num3Controller.text);
      setState(() {
        result = "El número mayor es: ${[num1, num2, num3].reduce((a, b) => a > b ? a : b)}";
      });
    } catch (e) {
      setState(() {
        result = "Por favor, ingresa números válidos.";
      });
    }
  }

  void findMin() {
    try {
      double num1 = double.parse(num1Controller.text);
      double num2 = double.parse(num2Controller.text);
      double num3 = double.parse(num3Controller.text);
      setState(() {
        result = "El número menor es: ${[num1, num2, num3].reduce((a, b) => a < b ? a : b)}";
      });
    } catch (e) {
      setState(() {
        result = "Por favor, ingresa números válidos.";
      });
    }
  }

  void calculateSquare() {
    try {
      double num1 = double.parse(num1Controller.text);
      setState(() {
        result = "El cuadrado de $num1 es: ${num1 * num1}";
      });
    } catch (e) {
      setState(() {
        result = "Por favor, ingresa un número válido en el campo Número 1.";
      });
    }
  }

  void calculateCube() {
    try {
      double num1 = double.parse(num1Controller.text);
      setState(() {
        result = "El cubo de $num1 es: ${num1 * num1 * num1}";
      });
    } catch (e) {
      setState(() {
        result = "Por favor, ingresa un número válido en el campo Número 1.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Matemáticas', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 174, 237),
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 255, 215, 248), Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ingrese tres números:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _buildTextField("Número 1", num1Controller),
            _buildTextField("Número 2", num2Controller),
            _buildTextField("Número 3", num3Controller),
            SizedBox(height: 20),
            _buildButton("Número mayor", findMax, Colors.green),
            _buildButton("Número menor", findMin, Colors.red),
            _buildButton("Cuadrado de Número 1", calculateSquare, Colors.orange),
            _buildButton("Cubo de Número 1", calculateCube, Colors.blue),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: const Color.fromARGB(255, 11, 0, 158)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Cambio aquí
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
