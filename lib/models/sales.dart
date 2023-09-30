class SalesTeam {
  final String name;
  final String id;

  SalesTeam({
    required this.name,
    required this.id,
  });

  factory SalesTeam.fromJson(Map<String, dynamic> json) {
    return SalesTeam(
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
  
    SalesTeam copy({
    String? id,
    String? name,
  }) {
    return SalesTeam(
      id: id ?? this.id,
      name: name ?? this.name,

    );
  }
  
  }