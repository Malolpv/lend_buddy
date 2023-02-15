import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/collections/user.dart';
import 'package:lend_buddy/services/isar_helper.dart';

class NewLend extends StatefulWidget {
  @override
  State<NewLend> createState() => _NewLendState();

  final int userId;
  final IsarHelper datasource;

  NewLend({super.key, required this.userId, required this.datasource}) {
    initializeData();
  }

  List<Item> items = [];

  void initializeData() async {
    items = await datasource.getAllItems(userId);
    newLend.user.value = await datasource.getUserById(userId);
  }

  Lend newLend = Lend();
}

class _NewLendState extends State<NewLend> {
  final dialogController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dialogController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future openDialog(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("New Item"),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: "Item name"),
              controller: dialogController,
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    if (dialogController.text != "") {
                      User? tmpUser =
                          await widget.datasource.getUserById(widget.userId);
                      Item newItem = Item()
                        ..libelle = dialogController.text
                        ..user.value = tmpUser;
                      widget.datasource.saveItem(newItem);
                      setState(() {
                        widget.initializeData();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Submit"))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Lend'),
      ),
      body: Column(children: [
        Container(
          child: Column(
            children: [
              const Text("Select an item"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      hint: const Text("Choose an item"),
                      items: widget.items.map((item) {
                        return DropdownMenuItem(
                            value: item,
                            key: Key(item.id.toString()),
                            child: Row(children: [Text(item.libelle)]));
                      }).toList(),
                      onChanged: (Item? item) {
                        widget.newLend.item.value = item;
                      }),
                  ElevatedButton(
                      onPressed: () {
                        openDialog(context);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
        TextField(
          decoration:
              const InputDecoration(hintText: "Ending date (YYYY-MM-DD)"),
          controller: dateController,
        ),
        ElevatedButton(
          onPressed: () {
            widget.newLend
              ..startDate = DateTime.now()
              ..endDate = DateTime.parse(dateController.text);

            widget.datasource.saveLend(widget.newLend);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ]),
    );
  }
}
