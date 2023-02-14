import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lend_buddy/services/isar_helper.dart';

class NewLend extends StatelessWidget {
  final int userId;
  final IsarHelper datasource;

  const NewLend({super.key, required this.userId, required this.datasource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
