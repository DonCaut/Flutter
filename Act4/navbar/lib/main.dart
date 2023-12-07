import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Navegación'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Llamando a carousel
          CarouselPage(),

          // llamando a perfil de usuario
          UserProfilePage(),
        ],
      ),
      //Barra de navegación que se ve abajo que contiene a carousel y perfil
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Carousel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
//clase de carousel
class CarouselPage extends StatelessWidget {
  final List<String> imageNames = [
    'bulbasaur.png',
    'charmander.png',
    'squirtle.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        items: imageNames.map((imageName) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/$imageName'),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 400.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
//clase de perfil de usuario
class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/perfil.png'), 
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Editar Perfil'),
          ),
        ],
      ),
    );
  }
}
