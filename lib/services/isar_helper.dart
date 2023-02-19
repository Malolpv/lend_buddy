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
    isar.writeTxnSync<int>(() => isar.users.putSync(user));
  }

  Future<void> saveItem(Item item) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.items.putSync(item));
  }

  Future<void> saveLend(Lend lend) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.lends.putSync(lend));
  }

  Future<void> saveContact(Contact contact) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.contacts.putSync(contact));
  }

  Future<void> saveCategory(Category category) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categorys.putSync(category));
  }

  Future<void> savePhoto(Photo photo) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.photos.putSync(photo));
  }

  //Get all items by user
  Future<List<Item>> getAllItems(int userId) async {
    final isar = await db;
    return isar.items
        .where()
        .filter()
        .user((u) => u.idEqualTo(userId))
        .findAll();
  }

  //Get all lend active by user
  Future<List<Lend>> getAllActiveLend(int userId) async {
    final isar = await db;
    return isar.lends
        .where()
        .filter()
        .user((u) => u.idEqualTo(userId))
        .and()
        .isReturnedEqualTo(false)
        .findAll();
  }

  //Get all contact by user
  Future<List<Contact>> getAllContact(int userId) async {
    final isar = await db;
    return isar.contacts.filter().user((u) => u.idEqualTo(userId)).findAll();
  }

  //Get the User with given Email
  Future<User?> getUserByEmail(String email) async {
    final isar = await db;
    return isar.users.filter().mailEqualTo(email).findFirst();
  }

  Future<User?> getUserById(int idUser) async {
    final isar = await db;
    return isar.users.filter().idEqualTo(idUser).findFirst();
  }

  Future<bool> deleteLend(int id) async {
    final isar = await db;
    return isar.writeTxn(() => isar.lends.delete(id));
  }
}
