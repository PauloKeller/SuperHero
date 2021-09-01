import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/modules/hero_details/hero_details.dart';
import 'package:super_hero/src/modules/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _goToHeroDetails(HeroModel model) {
    final route = MaterialPageRoute(
        builder: (context) => HeroDetailsPage(model)
    );

    Navigator.push(context, route);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
