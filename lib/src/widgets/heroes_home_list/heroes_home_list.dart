import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/modules/hero_details/hero_details_module.dart';

class HeroesHomeList extends StatelessWidget {
  final UnmodifiableListView<HeroModel> _heroes;

  const HeroesHomeList(this._heroes, {Key? key}) : super(key: key);

  void _goToHeroDetails(BuildContext context, HeroModel model) {
    final route = MaterialPageRoute(builder: (context) => HeroDetailsPage(model));

    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _heroes.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            _heroes[index].name,
            key: Key(_heroes[index].name),
          ),
          onTap: () => _goToHeroDetails(context, _heroes[index]),
        );
      },
    );
  }
}
