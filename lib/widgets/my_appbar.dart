import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    leading: Icon(
      Icons.menu,
      color: Colors.white,
    ),
    actions: [
      Icon(
        Icons.camera_alt,
        color: Colors.white,
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 20,
      ),
    ],
    title: Text(
      "Hello World",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    centerTitle: true,
  );
}
