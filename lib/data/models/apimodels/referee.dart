class Referee{
  final int id;
  final String? name;
  final String? type;
  final String? nationality;

  const Referee({
    required this.id,
    required this.name,
    required this.type,
    required this.nationality,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'nationality': nationality,
    };
  }

  factory Referee.fromMap(Map<String, dynamic> map) {
    return Referee(
      id: map['id'] as int,
      name: map['name'] as String?,
      type: map['type'] as String?,
      nationality: map['nationality'] as String?,
    );
  }
}