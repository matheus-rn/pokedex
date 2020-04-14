import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeApi.dart';
import 'package:pokedex/stores/pokeapi.dart';

class AboutPokemon extends StatefulWidget {
  final PokeApiStore pokeApi;

  AboutPokemon(this.pokeApi);

  @override
  _AboutPokemonState createState() => _AboutPokemonState(this.pokeApi);
}

class _AboutPokemonState extends State<AboutPokemon>
    with SingleTickerProviderStateMixin {
  final PokeApiStore pokeApi;

  TabController _tabController;
  PageController _pageController;

  _AboutPokemonState(this.pokeApi);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Observer(
              builder: (context) {
                return AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: TabBar(
                      onTap: (index) {
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      controller: _tabController,
                      labelStyle: TextStyle(fontWeight: FontWeight.w700),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: ConstsApi.getColorType(
                          this.pokeApi.pokemonCurrent.type[0].toString()),
                      unselectedLabelColor: Color(0xff5f6368),
                      isScrollable: true,
                      indicator: MD2Indicator(
                        indicatorHeight: 3,
                        indicatorColor: ConstsApi.getColorType(
                            this.pokeApi.pokemonCurrent.type[0].toString()),
                        indicatorSize: MD2IndicatorSize.normal,
                      ),
                      tabs: <Widget>[
                        Tab(
                          text: "Sobre",
                        ),
                        Tab(
                          text: "Evolução",
                        ),
                        Tab(
                          text: "Status",
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          body: PageView(
            onPageChanged: (index) {
              _tabController.animateTo(index,
                  duration: Duration(milliseconds: 300));
            },
            controller: _pageController,
            children: <Widget>[
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
