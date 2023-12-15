import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: MyCarousel(),
      ),
    );
  }
}
// widget para el tag de tipo de Pokémon 
class PokemonTag extends StatelessWidget {
  final String element;
  final Color color;

  PokemonTag({required this.element, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        element,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
// Widget que contiene el slider y la información de los Pokémon
class MyCarousel extends StatelessWidget {
  final List<PokemonData> pokemonData = [
    PokemonData(name: 'Bulbasaur', type: 'Planta', number: 1, imageUrl: 'assets/bulbasaur.png'),
    PokemonData(name: 'Charmander', type: 'Fuego', number: 4, imageUrl: 'assets/charmander.png'),
    PokemonData(name: 'Squirtle', type: 'Agua', number: 7, imageUrl: 'assets/squirtle.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: pokemonData.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.width,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          viewportFraction: 0.7,
          initialPage: 0,
          aspectRatio: 1.0,
          onPageChanged: (index, reason) {
            print('Index: $index, Reason: $reason');
          },
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final pokemon = pokemonData[index];
          return Card(
            child: Column(
              children: [
                // Imagen del Pokémon arriba de todo
                Image.asset(
                  pokemon.imageUrl,
                  width: double.infinity, 
                  height: 150.0, 
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        '${pokemon.number}. ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(pokemon.name),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        PokemonTag(
                          element: pokemon.type,
                          color: _getColorForType(pokemon.type),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'No. ${pokemon.number}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
// Función para obtener el color de un tipo
  Color _getColorForType(String type) {
    switch (type.toLowerCase()) {
      case 'planta':
        return Colors.green;
      case 'fuego':
        return Colors.orange;
      case 'agua':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
// Clase que representa los datos de un Pokémon
class PokemonData {
  final String name;
  final String type;
  final int number;
  final String imageUrl;

  PokemonData({
    required this.name,
    required this.type,
    required this.number,
    required this.imageUrl,
  });
}

