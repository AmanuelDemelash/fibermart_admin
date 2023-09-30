class CustomerTypes {
  final String name;
  final String id;

  CustomerTypes({
    required this.name,
    required this.id,
  });

  factory CustomerTypes.fromJson(Map<String, dynamic> json) {
    return CustomerTypes(
      name: json['name'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
  
    CustomerTypes copy({
    String? id,
    String? name,
  }) {
    return CustomerTypes(
      id: id ?? this.id,
      name: name ?? this.name,

    );
  }
  
  }