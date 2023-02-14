import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/user.dart';

part 'contact.g.dart';

@collection
class Contact {
  Id id = Isar.autoIncrement;
  String? name, surname;
  final user = IsarLink<User>();
  // Contact(this._id, this._name, this._surname);
}
