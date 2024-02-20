import 'package:flutter/foundation.dart';

class WeightDifferenceNotifier extends ChangeNotifier {
  Map<String, double> _weightDifferences = {};
  List<String> _lowWeightProducts = [];

  Map<String, double> get weightDifferences => _weightDifferences;
  List<String> get lowWeightProducts => _lowWeightProducts;

  void setWeightDifferences(Map<String, double> differences) {
    _weightDifferences = differences;
    _updateLowWeightProducts();
    notifyListeners();
  }

  void _updateLowWeightProducts() {
    _lowWeightProducts.clear();
    _weightDifferences.forEach((productName, weightDifference) {
      if (weightDifference < 20) {
        _lowWeightProducts.add(productName);
      }
    });
  }
}
