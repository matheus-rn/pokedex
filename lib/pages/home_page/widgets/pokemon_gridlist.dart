import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/stores/pokeapi.dart';

class PokemonGridList extends StatelessWidget {
  final PokeApi pokeApi;

  const PokemonGridList(this.pokeApi);

  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeAPiStore = PokeApiStore();

    return AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        addAutomaticKeepAlives: true,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: this.pokeApi.pokemon.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: ScaleAnimation(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        pokeAPiStore.getImage(pokeApi.pokemon[index].num),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
