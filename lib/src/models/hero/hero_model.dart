import 'package:super_hero/src/models/appearance/appearance_model.dart';
import 'package:super_hero/src/models/models.dart';

class HeroModel {
  final int id;
  final String name;
  final String slug;
  final PowerStatsModel powerStats;
  final AppearanceModel appearance;

  HeroModel(this.id, this.name, this.slug, this.powerStats, this.appearance);

  HeroModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        slug = map['slug'],
        powerStats = PowerStatsModel.fromMap(map['powerstats']),
        appearance = AppearanceModel.fromMap(map["appearance"]);
}
