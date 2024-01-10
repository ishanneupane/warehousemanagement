import 'package:flutter/material.dart';
import 'package:warehousemanagement/dashhhhh.dart';
import 'package:warehousemanagement/login.dart';
import 'package:warehousemanagement/splash.dart';

import 'dashboard.dart';
import 'fill.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
