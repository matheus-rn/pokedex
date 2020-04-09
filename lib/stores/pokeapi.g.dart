// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$getPokeApiComputed;

  @override
  PokeApi get getPokeApi =>
      (_$getPokeApiComputed ??= Computed<PokeApi>(() => super.getPokeApi))
          .value;
  Computed<Pokemon> _$pokemonCurrentComputed;

  @override
  Pokemon get pokemonCurrent => (_$pokemonCurrentComputed ??=
          Computed<Pokemon>(() => super.pokemonCurrent))
      .value;

  final _$_pokeApiAtom = Atom(name: '_PokeApiStoreBase._pokeApi');

  @override
  PokeApi get _pokeApi {
    _$_pokeApiAtom.context.enforceReadPolicy(_$_pokeApiAtom);
    _$_pokeApiAtom.reportObserved();
    return super._pokeApi;
  }

  @override
  set _pokeApi(PokeApi value) {
    _$_pokeApiAtom.context.conditionallyRunInAction(() {
      super._pokeApi = value;
      _$_pokeApiAtom.reportChanged();
    }, _$_pokeApiAtom, name: '${_$_pokeApiAtom.name}_set');
  }

  final _$_pokemonCurrentAtom = Atom(name: '_PokeApiStoreBase._pokemonCurrent');

  @override
  Pokemon get _pokemonCurrent {
    _$_pokemonCurrentAtom.context.enforceReadPolicy(_$_pokemonCurrentAtom);
    _$_pokemonCurrentAtom.reportObserved();
    return super._pokemonCurrent;
  }

  @override
  set _pokemonCurrent(Pokemon value) {
    _$_pokemonCurrentAtom.context.conditionallyRunInAction(() {
      super._pokemonCurrent = value;
      _$_pokemonCurrentAtom.reportChanged();
    }, _$_pokemonCurrentAtom, name: '${_$_pokemonCurrentAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic getPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemon(Pokemon pokemon) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setPokemon(pokemon);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage(String numberImage) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(numberImage);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'getPokeApi: ${getPokeApi.toString()},pokemonCurrent: ${pokemonCurrent.toString()}';
    return '{$string}';
  }
}
