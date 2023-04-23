class MatchScoreDuration{
  final int? home;
  final int? away;

  const MatchScoreDuration({
    required this.home,
    required this.away,
  });

  Map<String, dynamic> toMap() {
    return {
      'home': home,
      'away': away,
    };
  }

  factory MatchScoreDuration.fromMap(Map<String, dynamic> map) {
    return MatchScoreDuration(
      home: map['home'] as int?,
      away: map['away'] as int?,
    );
  }
}