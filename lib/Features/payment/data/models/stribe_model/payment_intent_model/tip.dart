class Tip {
  final int id;
  final String message;

  Tip({required this.id, required this.message});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(id: json['id'] ?? 0, message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'message': message};
  }
}
