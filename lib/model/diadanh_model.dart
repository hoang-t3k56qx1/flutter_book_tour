class DiaDanh {
  final int id;
  final String ten;
  final String moTa;

  DiaDanh({
    required this.id,
    required this.ten,
    required this.moTa,
  });

  factory DiaDanh.fromJson(Map<String, dynamic> json) {
    return DiaDanh(
      id: json['id'],
      ten: json['ten'],
      moTa: json['moTa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ten': ten,
      'moTa': moTa,
    };
  }
}