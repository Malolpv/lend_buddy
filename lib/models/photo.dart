import 'package:isar/isar.dart';

part 'photo.g.dart';

@collection
class Photo {
  Id id = Isar.autoIncrement;
  String? path;

  // Photo(this._id, this._path);
}
