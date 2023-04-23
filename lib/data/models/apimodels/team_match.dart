class TeamMatch{
  final int? id;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crest;

  const TeamMatch({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
    };
  }

  factory TeamMatch.fromMap(Map<String, dynamic> map) {
    return TeamMatch(
      id: map['id'] as int?,
      name: map['name'] as String?,
      shortName: map['shortName'] as String?,
      tla: map['tla'] as String?,
      crest: map['crest'] as String?,
    );
  }
}