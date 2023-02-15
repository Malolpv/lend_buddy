import 'package:flutter/material.dart';
import 'package:lend_buddy/collections/user.dart';
import 'package:lend_buddy/screens/new_lend.dart';
import 'package:lend_buddy/services/isar_helper.dart';
import 'package:lend_buddy/widgets/custom_app_bar.dart';
import 'package:lend_buddy/widgets/navdrawer.dart';
import 'package:lend_buddy/widgets/lended_items_list.dart';

class HomeScreen extends StatelessWidget {
  final db = IsarHelper();
  final int userId;

  late User? user;

  HomeScreen({super.key, required this.userId}) {
    initializeData(userId);
  }

  void initializeData(int userId) async {
    user = await db.getUserById(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: const CustomAppBar(
        title: "Home",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Add")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewLend(userId: userId, datasource: db)));
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
          Expanded(
            child: LendedItemsList(dataSource: db, userId: userId),
          ),
        ],
      ),
    );
  }
}
