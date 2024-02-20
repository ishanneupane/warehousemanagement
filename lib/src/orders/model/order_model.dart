class OrderModel {
  final String? id;
  final String productName;
  final double weight;
  final DateTime publishedDate;

  OrderModel({
    this.id,
    required this.productName,
    required this.weight,
    required this.publishedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'weight': weight,
      'publishedDate': publishedDate.toIso8601String(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      productName: json['Product'],
      weight: double.parse(json['Weight(kg)']),
      publishedDate: _parseDate(json['publishedDate']),
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
