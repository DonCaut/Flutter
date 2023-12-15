import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Hola Mundo App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('¡Hola Mundo!');
          },
          child: Text('Presionar para Saludar'),
        ),
      ),
    );
  }
}
