import 'package:isar/isar.dart';
import 'package:lend_buddy/models/category.dart';
import 'package:lend_buddy/models/contact.dart';
import 'package:lend_buddy/models/item.dart';
import 'package:lend_buddy/models/lend.dart';
import 'package:lend_buddy/models/photo.dart';
import 'package:lend_buddy/models/user.dart';

class IsarHelper {
  final isarDb = Isar.open([
    UserSchema,
    ItemSchema,
    LendSchema,
    PhotoSchema,
    ContactSchema,
    CategorySchema
  ]);
}
