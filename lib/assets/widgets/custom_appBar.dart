import 'package:flutter/material.dart';
import 'package:sindion/utils/my_theme.dart';

createCustomAppBar() {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
    backgroundColor: Colors.transparent,
  );
}
