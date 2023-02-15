import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/contact.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/photo.dart';
import 'package:lend_buddy/collections/user.dart';

part 'lend.g.dart';

@collection
class Lend {
  //attributes
  Id id = Isar.autoIncrement;

  final item = IsarLink<Item>();
  final user = IsarLink<User>();

  bool isReturned = false;
  DateTime? startDate, endDate;

  //Constructor
  //Lend(this._id, this._item, this._contact, this._user, this._startDate,
  //   this._endDate, this._photo);

  void returned() => isReturned = true;
}
