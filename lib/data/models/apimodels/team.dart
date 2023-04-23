import 'package:world_cup_qatar_2022/data/models/apimodels/coach.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/player.dart';

class Team{
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;
  final Coach coach;
  final List<Player> squad;

  const Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
    required this.coach,
    required this.squad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
      'coach': coach,
      'squad': squad,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] as int,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      tla: map['tla'] as String,
      crest: map['crest'] as String,
      coach: map['coach'] as Coach,
      squad: map['squad'] as List<Player>,
    );
  }
}