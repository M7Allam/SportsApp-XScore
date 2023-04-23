class Season{
  final int id;
  final String? startDate;
  final String? endDate;
  final int currentMatchday;
  final String? winner;

  const Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'currentMatchday': currentMatchday,
      'winner': winner,
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map['id'] as int,
      startDate: map['startDate'] as String?,
      endDate: map['endDate'] as String?,
      currentMatchday: map['currentMatchday'] as int,
      winner: map['winner'] as String?,
    );
  }
}