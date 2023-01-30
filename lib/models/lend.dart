import 'package:lend_buddy/models/Contact.dart';
import 'package:lend_buddy/models/Item.dart';
import 'package:lend_buddy/models/photo.dart';
import 'package:lend_buddy/models/user.dart';

class Lend {
  //attributes
  int _id;

  Item _item;
  User _user;
  Photo _photo;
  Contact _contact;

  DateTime _startDate, _endDate;

  //Constructor
  Lend(this._id, this._item, this._contact, this._user, this._startDate,
      this._endDate, this._photo);
}
