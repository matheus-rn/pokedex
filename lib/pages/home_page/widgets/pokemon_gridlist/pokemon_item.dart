import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeApi.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonItem(this.pokemon);

  @override
  Widget build(BuildContext context) {
    //PokeApiStore pokeAPiStore = PokeApiStore();

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -10,
            right: -10,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                child: Image.asset(
                  ConstsApp.whitePokeball,
                  height: 90,
                  width: 90,
                ),
                opacity: 0.2,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CachedNetworkImage(
              height: 80,
              width: 80,
              placeholder: (context, url) => Container(
                color: Colors.transparent,
              ),
              imageUrl:
                  "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/" +
                      "images/${this.pokemon.num}.png",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Text(
              this.pokemon.name.trim(),
              style: TextStyle(
                fontFamily: 'Google',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 10),
            child: buildBoxTypes(this.pokemon.type),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: ConstsApi.getColorType(this.pokemon.type[0]),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  Widget buildBoxTypes(List<String> types) {
    List<Widget> typesPokemon = [];
    types.forEach((type) {
      typesPokemon.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
              child: Text(
                type,
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      );
    });

    return Container(
      child: Column(
        children: typesPokemon,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
