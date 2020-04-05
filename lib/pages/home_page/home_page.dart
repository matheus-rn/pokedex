import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/stores/pokeapi.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeAPiStore = PokeApiStore();
    pokeAPiStore.getPokemonList();
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
                          PokeApi _pokeApi = pokeAPiStore.pokeApi;
                          return (_pokeApi != null)
                              ? ListView.builder(
                                  itemCount: _pokeApi.pokemon.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(_pokeApi.pokemon[index].name),
                                    );
                                  },
                                )
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
