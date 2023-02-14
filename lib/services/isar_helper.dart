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
  late int userId;

  IsarHelper(this.userId) {
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

  Future<void> saveItem(Item item) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.items.put(item));
  }

  Future<void> saveLend(Lend lend) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.lends.put(lend));
  }

  Future<void> saveContact(Contact contact) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.contacts.put(contact));
  }

  Future<void> saveCategory(Category category) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.categorys.put(category));
  }

  Future<void> savePhoto(Photo photo) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.photos.put(photo));
  }

  //Get all items by user
  Future<List<Item>> getAllItems() async {
    final isar = await db;
    return isar.items
        .where()
        .filter()
        .user((u) => u.idEqualTo(userId))
        .findAll();
  }

  //Get all lend by user
  Future<List<Lend>> getAllLend() async {
    final isar = await db;
    return isar.lends.filter().user((u) => u.idEqualTo(userId)).findAll();
  }

  //Get all contact by user
  Future<List<Contact>> getAllContact() async {
    final isar = await db;
    return isar.contacts.filter().user((u) => u.idEqualTo(userId)).findAll();
  }

  Future<User?> getUserByEmail(String email) async {
    final isar = await db;
    return isar.users.filter().mailEqualTo(email).findFirst();
  }
}
