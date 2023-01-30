import 'package:lend_buddy/models/Category.dart';
import 'package:lend_buddy/models/photo.dart';
import 'package:lend_buddy/models/user.dart';

class Item {
  //attributes
  int _id;
  User _user;
  Category _category;
  Photo _photo;
  String _libelle;

  Item(this._id, this._user, this._category, this._photo, this._libelle);
}
