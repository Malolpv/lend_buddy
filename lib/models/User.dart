import 'package:flutter/material.dart';

class User {
  int id;
  String name, surname, mail, pass;

  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.mail,
      required this.pass});
}
