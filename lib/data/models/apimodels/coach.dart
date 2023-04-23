class Coach{
  final int id;
  final String name;
  final String dateOfBirth;
  final String nationality;

  const Coach({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.nationality,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
  }

  factory Coach.fromMap(Map<String, dynamic> map) {
    return Coach(
      id: map['id'] as int,
      name: map['name'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
    );
  }
}