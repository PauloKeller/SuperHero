import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:super_hero/src/dto/all_heros_response_dto.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/providers/hero/heroes_provider.dart';

class HeroesProviderMock extends Mock implements HeroesProvider {}

void main() {
  final provider = HeroesProviderMock();

  setUp(() {});

  group('Test heroes provider', () {
    test('Test get all heroes should success', () async {
      final heroesMock = HeroModel(1, "test-1", "slug-1");
      final mock = AllHeroesResponseDTO([heroesMock]);

      when(provider.getAllHeroes()).thenAnswer((_) async => mock);

      final response = await provider.getAllHeroes();

      expect(response.results.length, 1);

      final heroResponse = response.results[0];

      expect(heroResponse.name, equals("test-1"));
      expect(heroResponse.id, equals(1));
    });
  });
}