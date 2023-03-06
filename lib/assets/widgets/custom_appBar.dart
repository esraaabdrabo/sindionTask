import 'package:flutter/material.dart';

createCustomAppBar() {
  var secondaryColor;
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: secondaryColor),
    backgroundColor: Colors.transparent,
  );
}
