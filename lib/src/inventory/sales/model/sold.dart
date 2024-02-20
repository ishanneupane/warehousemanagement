class Sold {
  final String name;
  final String? id;
  final String productName;
  final double weight;

  Sold({
    required this.name,
    this.id,
    required this.productName,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'productName': productName,
      'weight': weight,
    };
  }

  factory Sold.fromJson(Map<String, dynamic> json) {
    return Sold(
      name: json['Name'],
      id: json['id'],
      productName: json['Product'],
      weight: double.parse(json['Weight(kg)']),
    );
  }
}
