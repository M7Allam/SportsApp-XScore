import 'package:world_cup_qatar_2022/data/models/apimodels/season.dart';

class Competition{
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;
  final Season currentSeason;

  const Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
    required this.currentSeason,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type,
      'emblem': emblem,
      'currentSeason': currentSeason,
    };
  }

  factory Competition.fromMap(Map<String, dynamic> map) {
    return Competition(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
      type: map['type'] as String,
      emblem: map['emblem'] as String,
      currentSeason: Season.fromMap(map['currentSeason']),
    );
  }


}