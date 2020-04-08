import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/stores/pokeapi.dart';
import 'widgets/app_bar_home/app_bar_home.dart';
import 'widgets/pokemon_gridlist/pokemon_gridlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeAPiStore = PokeApiStore();
  @override
  void initState() {
    super.initState();
    if (pokeAPiStore.getPokeApi == null) {
      pokeAPiStore.getPokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statuBarWidth = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -(240 / 4.7),
              left: screenWidth - (240 / 1.6),
              child: Opacity(
                child: Image.asset(
                  ConstsApp.blackPokeball,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.1,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: statuBarWidth,
                  ),
                  AppBarHome(),
                  Expanded(
                    child: Container(
                      child: Observer(
                        builder: (BuildContext context) {
                          PokeApi _pokeApi = pokeAPiStore.getPokeApi;
                          return (_pokeApi != null)
                              ? PokemonGridList(_pokeApi)
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
