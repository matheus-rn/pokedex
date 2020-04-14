import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeApi;

  @observable
  Pokemon _pokemonCurrent;

  @computed
  PokeApi get getPokeApi => _pokeApi;

  @computed
  Pokemon get pokemonCurrent => _pokemonCurrent;

  set setPokeApi(PokeApi pokeApi) {
    _pokeApi = pokeApi;
  }

  @action
  getPokemonList() {
    _pokeApi = null;
    loadPokeApi().then((pokeList) {
      _pokeApi = pokeList;
    });
  }

  @action
  setPokemon(Pokemon pokemon) {
    _pokemonCurrent = pokemon;
  }

  @action
  Widget getImage(String numberImage) {
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
      imageUrl:
          "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/" +
              "images/$numberImage.png",
    );
  }

  Future<PokeApi> loadPokeApi() async {
    try {
      final response = await http.get(ConstsApi.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
