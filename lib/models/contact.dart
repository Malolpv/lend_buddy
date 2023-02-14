import 'package:isar/isar.dart';

part 'contact.g.dart';

@collection
class Contact {
  Id id = Isar.autoIncrement;
  String? name, surname;

  // Contact(this._id, this._name, this._surname);
}
