import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HeroModel> _heroes = [];

  final HeroesProviderInterface _provider = HeroesProvider("https://akabab.github.io/superhero-api/api");

  void _fetchHeroes() async {
    try {
      final data = await _provider.getAllHeroes();

      setState(() {
        _heroes = data.results;
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();

    _fetchHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _heroes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_heroes[index].name),
            );
          }
      ),
    );
  }
}
