import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;

class InventoryCalculator {
  static Future<Map<String, double>> calculateWeightDifference(
      sql.Database currentInventoryDatabase,
      sql.Database salesInventoryDatabase) async {
    Map<String, double> currentInventoryWeights = {};
    Map<String, double> salesInventoryWeights = {};

    // Query currentInventory database
    List<
        Map<String,
            dynamic>> currentResult = await currentInventoryDatabase.rawQuery(
        'SELECT productName, SUM(weight) AS totalWeight FROM currentInventory GROUP BY productName');
    currentResult.forEach((row) {
      currentInventoryWeights[row['productName']] =
          (row['totalWeight'] ?? 0) as double;
    });

    // Query salesInventory database
    List<
        Map<String,
            dynamic>> salesResult = await salesInventoryDatabase.rawQuery(
        'SELECT productName, SUM(weight) AS totalWeight FROM salesInventory GROUP BY productName');
    salesResult.forEach((row) {
      salesInventoryWeights[row['productName']] =
          (row['totalWeight'] ?? 0) as double;
    });

    // Calculate difference for each product
    Map<String, double> weightDifferences = {};
    currentInventoryWeights.forEach((productName, currentWeight) {
      double salesWeight = salesInventoryWeights[productName] ?? 0;
      weightDifferences[productName] = currentWeight - salesWeight;
    });

    return weightDifferences;
  }
}
