import 'package:flutter/material.dart';
//Integrantes: Massimo Larger y Claudio Uribe

void main() {
  runApp(AppControl());
}

class AppControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 16),
                buildInputField('Email', Icons.email, Colors.white, emailController),
                const SizedBox(height: 16),
                buildInputField('Contraseña', Icons.lock, Colors.white, passwordController),
                const SizedBox(height: 16),
                Text(
                  '¿Olvidaste tu contraseña?',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (validateEmailAndPassword()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Mostrar mensaje de error
                      print('Email o contraseña no válidos');
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, IconData icon, Color textColor, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(color: textColor),
      ),
    );
  }

  bool validateEmailAndPassword() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.contains('@') && password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: const Text(
            'Home',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}