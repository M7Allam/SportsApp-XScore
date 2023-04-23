class MatchesResultSet{
  final int count;
  final String first;
  final String last;
  final int played;

  const MatchesResultSet({
    required this.count,
    required this.first,
    required this.last,
    required this.played,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'first': first,
      'last': last,
      'played': played,
    };
  }

  factory MatchesResultSet.fromMap(Map<String, dynamic> map) {
    return MatchesResultSet(
      count: map['count'] as int,
      first: map['first'] as String,
      last: map['last'] as String,
      played: map['played'] as int,
    );
  }
}