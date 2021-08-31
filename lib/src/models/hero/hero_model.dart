class HeroModel {
  final int id;
  final String name;
  final String slug;

  HeroModel(this.id, this.name, this.slug);

  HeroModel.fromMap(Map<String, dynamic> map) :
  id = map['id'],
  name = map['name'],
  slug = map['slug'];
}