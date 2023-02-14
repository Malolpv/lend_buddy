import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String? name, surname, mail, pass;

  //User(this.id, this.mail, this.pass, this.surname, this.name);
}
