
class CompetitionMatch{
  final int id;
  final String? name;
  final String? code;
  final String? type;
  final String? emblem;

  const CompetitionMatch({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type,
      'emblem': emblem,
    };
  }

  factory CompetitionMatch.fromMap(Map<String, dynamic> map) {
    return CompetitionMatch(
      id: map['id'] as int,
      name: map['name'] as String?,
      code: map['code'] as String?,
      type: map['type'] as String?,
      emblem: map['emblem'] as String?,
    );
  }


}