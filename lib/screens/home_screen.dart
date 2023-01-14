import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lend_buddy/constants.dart';
import 'package:lend_buddy/models/Item.dart';
import 'package:lend_buddy/widgets/custom_app_bar.dart';
import 'package:lend_buddy/widgets/lended_item_container.dart';
import 'package:lend_buddy/widgets/navdrawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: const CustomAppBar(
        title: "Home",
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: secondaryBgColour.shade900)),
              child: Icon(
                Icons.add,
                color: secondaryBgColour.shade900,
                size: 35,
              ),
            ),
            LendedItemContainer(
              lendedItem: Item(id: 1, borrowerName: "Malo", image: "test"),
            )
          ],
        ),
      ),
    );
  }
}
