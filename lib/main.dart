import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;
import 'package:provider/provider.dart';
import 'package:warehousemanagement/src/inventory/arrival/arrival_inventory_sqlite.dart';
import 'package:warehousemanagement/src/inventory/sales/sales_db.dart';
import 'package:warehousemanagement/src/inventory/status_of_inventory/provider.dart';
import 'package:warehousemanagement/src/login/login.dart';

sql.Database? currentInventoryDatabase;
sql.Database? salesInventoryDatabase;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  currentInventoryDatabase = await CurrentInventory.db();
  salesInventoryDatabase = await SalesInventory.db();
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeightDifferenceNotifier(),
      child: MyApp(),
    ),
  );
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
