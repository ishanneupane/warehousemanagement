class OrderModel {
  int? id;
  final String productName;
  final double weight;
  final DateTime publishedDate;
  bool isCompleted;

  OrderModel({
    this.id,
    required this.productName,
    required this.weight,
    required this.publishedDate,
    this.isCompleted = false,
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
      id: json['id'] as int?,
      productName: json['productName'] as String? ?? '',
      weight: json['weight'] != null
          ? double.parse(json['weight'].toString())
          : 0.0,
      publishedDate: json['publishedDate'] != null
          ? DateTime.parse(json['publishedDate'].toString())
          : DateTime.now(),
    );
  }
}
