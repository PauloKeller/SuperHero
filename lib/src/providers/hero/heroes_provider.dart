import 'package:super_hero/src/dto/all_heros_response_dto.dart';
import 'package:super_hero/src/providers/providers.dart';

abstract class HeroesProviderInterface {
  Future<AllHeroesResponseDTO> getAllHeroes();
}

enum EndPoints {
  all,
}

class HeroesProvider extends BaseProvider implements HeroesProviderInterface {
  HeroesProvider(baseUrl) : super(baseUrl);

  String _getEndPoint(EndPoints endPoint) {
    switch (endPoint) {
      case EndPoints.all:
        return '/all';
      default:
        return '';
    }
  }

  Future<AllHeroesResponseDTO> getAllHeroes() async {
    final response = await get(_getEndPoint(EndPoints.all));
    final List<dynamic> mapList = response.data;
    return AllHeroesResponseDTO.fromMap(mapList);
  }
}
