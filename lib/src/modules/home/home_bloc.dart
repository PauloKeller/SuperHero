import 'package:flutter/material.dart';
import 'package:super_hero/src/models/models.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

abstract class HomeBlocInterface with ChangeNotifier {
  void fetchAllHeroes();
  set errorMessage(String value);
  bool get hasError;
  String get errorMessage;
  List<HeroModel> get heroes;
}

class HomeBloc with ChangeNotifier implements HomeBlocInterface {
  HeroesProvider _heroesProvider;

  List<HeroModel> _heroes = List.unmodifiable([]);
  bool _hasError = false;
  String _errorMessage = "";

  set errorMessage(String value) {
    _hasError = true;
    _errorMessage = value;
  }

  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  List<HeroModel> get heroes => _heroes;

  HomeBloc(this._heroesProvider) {
    fetchAllHeroes();
  }

  void fetchAllHeroes() async {
    try {
      final data = await _heroesProvider.getAllHeroes();
      _heroes = data.results;
    } catch (e) {
      _hasError = true;
      errorMessage = "Fail to fetch data";
    }

    notifyListeners();
  }
}