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

  void _goToSearchDelegate() {
    showSearch(context: context, delegate: HomeSearchDelegate());
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

class HomeSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Icon(Icons.clear),
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
