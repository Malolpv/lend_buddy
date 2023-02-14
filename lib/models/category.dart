import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;
  String? libelle;

  // Category(this._id, this._libelle);
}
