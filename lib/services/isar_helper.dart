import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/category.dart';
import 'package:lend_buddy/collections/contact.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/collections/photo.dart';
import 'package:lend_buddy/collections/user.dart';
import 'package:path/path.dart';

class IsarHelper {
  late Future<Isar> db;

  IsarHelper() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        UserSchema,
        ItemSchema,
        LendSchema,
        PhotoSchema,
        ContactSchema,
        CategorySchema
      ], inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveUser(User user) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.users.put(user));
  }

  // Future<List<Lend>> getAllLended() async {
  //   final isar = await db;
  //   isar.lends
  // }
}
