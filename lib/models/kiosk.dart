class KioskModel {
  final String name;
  final int id;
  final String size;
  final bool bestSeller;

  KioskModel({
    required this.name,
    required this.id,
    required this.size,
    required this.bestSeller,
  });

  factory KioskModel.fromJson(Map<String, dynamic> json) {
    return KioskModel(
      name: json['name'] as String,
      id: int.parse(json['id'].toString()),
      size: json['size'] as String,
       bestSeller:  json['bestSeller'] == false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'size': size,
      'bestSeller': bestSeller,
    };
  }
}
