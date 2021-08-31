import 'package:dio/src/dio.dart';
import 'package:super_hero/src/providers/providers.dart';

abstract class HeroesProviderInterface {

}

class HeroesProvider extends BaseProvider implements HeroesProviderInterface {
  HeroesProvider(Dio dio) : super(dio);

  Future<dynamic> getAllHeroes() {
    return null;
  }
}