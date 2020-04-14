import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/stores/pokeapi.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'about_pokemon/about_pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokeApi pokeApi;
  final int index;

  const PokemonDetailPage(this.pokeApi, this.index);

  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeAPiStore = PokeApiStore();
    pokeAPiStore.setPokemon(pokeApi.pokemon[index]);
    PageController _controller = PageController(initialPage: index);
    MultiTrackTween _animation = MultiTrackTween(
      [
        Track("rotation").add(
          Duration(seconds: 10),
          Tween(begin: 0.0, end: 0.0),
          curve: Curves.linear,
        ),
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Observer(
          builder: (context) {
            return AppBar(
              title: Opacity(
                child: Text(
                  pokeAPiStore.pokemonCurrent.name,
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                opacity: 0.0,
              ),
              backgroundColor: ConstsApi.getColorType(
                  pokeAPiStore.pokemonCurrent.type[0].toString()),
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            );
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) {
              Color a = ConstsApi.getColorType(
                  pokeAPiStore.pokemonCurrent.type[0].toString());
              return Container(
                color: a,
                height: MediaQuery.of(context).size.height / 3,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: AboutPokemon(pokeAPiStore),
          ),
          Positioned(
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (pokemonIndex) {
                  pokeAPiStore.setPokemon(pokeApi.pokemon[pokemonIndex]);
                },
                itemCount: pokeApi.pokemon.length,
                itemBuilder: (BuildContext context, int i) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ControlledAnimation(
                          playback: Playback.LOOP,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              child: Hero(
                                child: Opacity(
                                  child: Image.asset(
                                    ConstsApp.whitePokeball,
                                    height: 180,
                                    width: 180,
                                  ),
                                  opacity: 0.2,
                                ),
                                tag: '',
                              ),
                              angle: animation['rotation'],
                            );
                          }),
                      Positioned(
                        top: 50,
                        child: Hero(
                          child: CachedNetworkImage(
                            height: 140,
                            width: 150,
                            placeholder: (context, url) => Container(
                              color: Colors.transparent,
                            ),
                            imageUrl:
                                "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/" +
                                    "images/${pokeApi.pokemon[i].num}.png",
                          ),
                          tag: pokeApi.pokemon[i].name,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
