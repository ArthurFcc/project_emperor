abstract class Entity {
  final int id;
  const Entity(this.id);

  set fromJson(Map<String, dynamic> json);
}
