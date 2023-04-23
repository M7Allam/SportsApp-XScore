class Player{
  final int id;
  final String name;
  final String position;
  final String dateOfBirth;
  final String nationality;

  const Player({
    required this.id,
    required this.name,
    required this.position,
    required this.dateOfBirth,
    required this.nationality,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as int,
      name: map['name'] as String,
      position: map['position'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
    );
  }
}