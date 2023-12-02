import 'package:flutter/material.dart';

void main() {
  runApp(const Carta());
}

class Carta extends StatelessWidget {
  const Carta({super.key});

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Universidad de los Lagos')),
        body: const Column(
          children: <Widget>[
            Spacer(),
            Carta1(),
            Carta2(),
            Carta3(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class Carta1 extends StatelessWidget {
  const Carta1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Ulagos sede Osorno')),
        ),
      ),
    );
  }
}

class Carta2 extends StatelessWidget {
  const Carta2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Ulagos sede Puerto Montt')),
        ),
      ),
    );
  }
}

class Carta3 extends StatelessWidget {
  const Carta3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Ulagos sede Chiloé')),
        ),
      ),
    );
  }
}

