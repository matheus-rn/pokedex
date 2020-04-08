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

  PokeApi get getPokeApi => _pokeApi;

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
  getPokemon({int index}) {
    return _pokeApi.pokemon[index];
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
      print("Erro ao carregar lista");
      return null;
    }
  }
}
