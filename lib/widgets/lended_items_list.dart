import 'package:flutter/material.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/services/isar_helper.dart';

class LendedItemsList extends StatelessWidget {
  // final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  final IsarHelper dataSource;
  final int userId;
  List<Lend> itemsLended;
  LendedItemsList(
      {super.key,
      required this.itemsLended,
      required this.dataSource,
      required this.userId}) {
    //initializeData();
  }

  void initializeData() async {
    itemsLended = await dataSource.getAllActiveLend(userId);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsLended.length,
      itemBuilder: (context, index) {
        final item = itemsLended[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item.id.toString()),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            // setState(() {
            //   items.removeAt(index);
            // });
            itemsLended.removeAt(index);
            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          // Show a red background as the item is swiped away to the rigth.
          background: slideRightBackground(),
          // Show a red background as the item is swiped away to the left.
          secondaryBackground: slideLeftBackground(),
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            padding: const EdgeInsets.all(20),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [Text(item.item.value!.libelle)],
            ),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this item?"),
                  actions: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        dataSource.deleteLend(item.id);
                        itemsLended.removeAt(index);
                      },
                      child: const Text('DELETE'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        item.returned();
                        dataSource.saveLend(item);
                        itemsLended.removeAt(index);
                      },
                      child: const Text('CANCEL'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
          Text(
            "Returned",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
