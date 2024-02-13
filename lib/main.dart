import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;
import 'inventory/arrival/arrival_inventory_sqlite.dart';
import 'inventory/sales/sales_db.dart';
import 'login/login.dart';

sql.Database? currentInventoryDatabase;
sql.Database? salesInventoryDatabase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  currentInventoryDatabase = await CurrentInventory.db();
  salesInventoryDatabase = await SalesInventory.db();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
