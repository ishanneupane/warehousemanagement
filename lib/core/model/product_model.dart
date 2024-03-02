class ProductModel {
  final String name;
  final String? id;
  final String productName;
  final double weight;
  final DateTime arrival;
  final DateTime bestBefore;

  ProductModel({
    required this.name,
    this.id,
    required this.productName,
    required this.weight,
    required this.arrival,
    required this.bestBefore,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'productName': productName,
      'weight': weight,
      'arrival': arrival.toIso8601String(),
      'bestBefore': bestBefore.toIso8601String(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['Name'],
      id: json['id'],
      productName: json['Product'],
      weight: double.parse(json['Weight(kg)']),
      arrival: _parseDate(json['Arrival']),
      bestBefore: _parseDate(json['BestBefore']),
    );
  }

  static DateTime _parseDate(String dateString) {
    List<String> parts = dateString.split('/');
    int month = int.parse(parts[0]);
    int day = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
}
