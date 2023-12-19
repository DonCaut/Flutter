import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFF39B660),
        scaffoldBackgroundColor: Color(0xFF39B660),
      ),
    );
  }
}

class CartaButton extends StatelessWidget {
  final Carta carta;
  final VoidCallback onPressed;

  CartaButton({required this.carta, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        'assets/${carta.numero}${carta.tipo}.png',
        height: 100,
        width: 100,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escoba'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('¿No tienes contraseña? Regístrate'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para continuar con Google
              },
              child: Text('Continuar con Google'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para continuar como invitado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
              child: Text('Continuar como invitado'),
            ),
          ],
        ),
      ),
    );
  }
}

class VictoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Victoria!'),
      ),
      body: Container(
        color: Color(0xFF39B660), // Color de fondo
        child: Center(
          child: Image.asset(
            'assets/victoria.png', // Ruta de la imagen en assets
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}



class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para registrar la cuenta
              },
              child: Text('Registrar cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Carta> baraja = [];
  List<Carta> manoJugador = [];
  List<Carta> manoCpu = [];
  List<Carta> mesa = [];
  int puntajeJugador = 0;
  int puntajeCpu = 0;

  void seleccionarCarta(Carta carta) {
    // Al seleccionar una carta, abre un cuadro de diálogo con las opciones
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar opción para ${carta.numero}${carta.tipo}'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Agrega aquí la imagen de la carta seleccionada
              Image.asset('assets/${carta.numero}${carta.tipo}.png', height: 100, width: 100),
              SizedBox(height: 20),
              // Botones de opción
              ElevatedButton(
                onPressed: () {
                  // Lógica para la opción 1
                  Navigator.pop(context); // Cerrar el cuadro de diálogo
                },
                child: Text('Opción 1'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Lógica para la opción 2
                  Navigator.pop(context); // Cerrar el cuadro de diálogo
                },
                child: Text('Opción 2'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget construirMesaInteractiva() {
  return Container(
    height: 120, // Ajusta según sea necesario
    child: Stack(
      children: mesa.asMap().entries.map((entry) {
        final index = entry.key;
        final carta = entry.value;

        return Positioned(
          left: index * 25.0, // Ajusta según sea necesario
          child: CartaButton(
            carta: carta,
            onPressed: () {
              // Lógica para manejar la interacción con la carta en la mesa
              seleccionarCarta(carta);
            },
          ),
        );
      }).toList(),
    ),
  );
}

  Widget construirManoJugador() {
    return Container(
      height: 120, // Ajusta según sea necesario
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: manoJugador.map((carta) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CartaButton(
              carta: carta,
              onPressed: () {
                // Lógica para manejar la interacción con la carta en la mano del jugador
                seleccionarCarta(carta);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    iniciarJuego();
  }

  void iniciarJuego() {
    baraja = barajarCartas();
    manoJugador = repartirCartas(baraja, 3);
    manoCpu = repartirCartas(baraja, 3);
    mesa = repartirCartas(baraja, 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Juego'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('Cartas en la Mesa:'),
            construirMesaInteractiva(),
            SizedBox(height: 20),
            Text('Tus cartas'),
            construirManoJugador(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VictoriaPage()),
               );
             },
             child: Text('Ir a victoria'),
           ),

          ],
        ),
      ),
    );
  }
}

class Carta {
  final int numero;
  final String tipo;

  Carta(this.numero, this.tipo);
}

List<Carta> barajarCartas() {
  final List<String> tipos = ['oro', 'espada', 'basto', 'copa'];
  final List<Carta> cartas = [];

  for (var tipo in tipos) {
    for (var i = 1; i <= 10; i++) {
      cartas.add(Carta(i, tipo));
    }
  }

  cartas.shuffle(Random());

  return cartas;
}

List<Carta> repartirCartas(List<Carta> baraja, int cantidad) {
  return baraja.sublist(0, cantidad);
}


