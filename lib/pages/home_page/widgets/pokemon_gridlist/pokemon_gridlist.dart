import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/pages/pokemon_detail_page/pokemon_detail_page.dart';

import 'pokemon_item.dart';

class PokemonGridList extends StatelessWidget {
  final PokeApi pokeApi;

  const PokemonGridList(this.pokeApi);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.4),
        itemCount: this.pokeApi.pokemon.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: ScaleAnimation(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: PokemonItem(this.pokeApi.pokemon[index]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PokemonDetailPage(this.pokeApi, index),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
