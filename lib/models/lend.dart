import 'package:isar/isar.dart';
import 'package:lend_buddy/models/contact.dart';
import 'package:lend_buddy/models/item.dart';
import 'package:lend_buddy/models/photo.dart';
import 'package:lend_buddy/models/user.dart';

part 'lend.g.dart';

@collection
class Lend {
  //attributes
  Id id = Isar.autoIncrement;

  final item = IsarLink<Item>();
  final user = IsarLink<User>();
  final photo = IsarLink<Photo>();
  final contact = IsarLink<Contact>();

  DateTime? startDate, endDate;

  //Constructor
  //Lend(this._id, this._item, this._contact, this._user, this._startDate,
  //   this._endDate, this._photo);
}
