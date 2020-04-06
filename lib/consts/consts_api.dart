import 'package:flutter/material.dart';

class ConstsApi {
  static String pokeApiUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Color getColorType(String type) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
        break;
      case 'Fire':
        return Color.fromRGBO(241, 106, 108, 1);
        break;
      case 'Water':
        return Colors.blue[200];
        break;
      case 'Grass':
        return Color.fromRGBO(102, 204, 175, 1);
        break;
      case 'Electric':
        return Colors.amber[300];
        break;
      case 'Ice':
        return Colors.cyanAccent[400];
        break;
      case 'Fighting':
        return Colors.orange[300];
        break;
      case 'Poison':
        return Colors.purple[300];
        break;
      case 'Ground':
        return Colors.orange[300];
        break;
      case 'Flying':
        return Colors.indigo[200];
        break;
      case 'Psychic':
        return Colors.pink;
        break;
      case 'Bug':
        return Colors.lightGreen[300];
        break;
      case 'Rock':
        return Colors.grey;
        break;
      case 'Ghost':
        return Colors.indigo[400];
        break;
      case 'Dark':
        return Colors.brown;
        break;
      case 'Dragon':
        return Colors.indigo[800];
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fairy':
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
