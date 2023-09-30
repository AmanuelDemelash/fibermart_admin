class Flowerpot {
  final String name;
  final String id;
  final int price;

  Flowerpot({
    required this.name,
    required this.id,
    required this.price,
  });

  factory Flowerpot.fromJson(Map<String, dynamic> json) {
    return Flowerpot(
      name: json['name'] as String,
      id: json['id'] as String,
      price: int.tryParse(json['price'] as String) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'price': price,
    };
  }

  Flowerpot copy({
    String? id,
    String? name,
    int? price,
  }) {
    return Flowerpot(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
