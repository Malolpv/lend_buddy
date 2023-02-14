import 'package:flutter/material.dart';
import 'package:lend_buddy/widgets/custom_app_bar.dart';
import 'package:lend_buddy/widgets/navdrawer.dart';
import 'package:lend_buddy/widgets/lended_items_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: const CustomAppBar(
        title: "Home",
      ),
      body: Center(
        child: LendedItemsList(),
      ),
    );
  }
}
