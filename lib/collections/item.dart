import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/category.dart';
import 'package:lend_buddy/collections/photo.dart';
import 'package:lend_buddy/collections/user.dart';

part 'item.g.dart';

@collection
class Item {
  //attributes
  Id id = Isar.autoIncrement;

  final user = IsarLink<User>();

  final category = IsarLink<Category>();
  final photo = IsarLink<Photo>();
  String libelle = "";

  //Item(this.id, this.user, this.category, this.photo, this.libelle);
}
