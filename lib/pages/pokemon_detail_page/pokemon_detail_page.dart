import 'package:flutter/material.dart';
import 'package:pokedex/models/pokeApi.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokeApi pokeApi;
  final int index;

  const PokemonDetailPage(this.pokeApi, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(this.pokeApi.pokemon[index].name.toString()),
      ),
    );
  }
}
