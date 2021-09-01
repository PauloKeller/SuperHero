import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/modules/hero_details/hero_details_module.dart';
import 'package:super_hero/src/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBlocInterface _homeBloc;

  void _goToHeroDetails(HeroModel model) {
    final route = MaterialPageRoute(builder: (context) => HeroDetailsPage(model));

    Navigator.push(context, route);
  }

  void _actionButtonTapped() {
    final model = _homeBloc.pickRandomHero();
    _goToHeroDetails(model);
  }

  void _goToSearchDelegate() async {
    final result = await showSearch<HeroModel?>(context: context, delegate: _HomeSearchDelegate(_homeBloc.heroes));

    if (result != null) {
      _goToHeroDetails(result);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _homeBloc = Provider.of<HomeBlocInterface>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super Hero"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _goToSearchDelegate,
          )
        ],
      ),
      body: Consumer<HomeBlocInterface>(
        builder: (context, bloc, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: bloc.heroes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  bloc.heroes[index].name,
                  key: Key(bloc.heroes[index].name),
                ),
                onTap: () => _goToHeroDetails(bloc.heroes[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.subdirectory_arrow_right),
        onPressed: _actionButtonTapped,
      ),
    );
  }
}

class _HomeSearchDelegate extends SearchDelegate<HeroModel?> {
  final UnmodifiableListView<HeroModel> _heroes;

  _HomeSearchDelegate(this._heroes);

  UnmodifiableListView<HeroModel>? _filterByQuery({int matchCount = 0}) {
    if (query.length > matchCount) {
      final filtered = _heroes.where((hero) => hero.name.toLowerCase().contains(query.toLowerCase()));
      return UnmodifiableListView(filtered);
    }

    return _heroes;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterByQuery(matchCount: 3);

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results?[index].name ?? "Empty"),
          leading: Icon(Icons.new_label),
          onTap: () {
            close(context, results?[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filterByQuery();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results?[index].name ?? "Empty"),
          onTap: () {
            close(context, results?[index]);
          },
        );
      },
    );
  }
}
