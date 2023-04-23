import 'package:world_cup_qatar_2022/data/models/apimodels/competition_match.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/referee.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/score.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/season.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/team_match.dart';

class Match{
  final CompetitionMatch competition;
  final Season season;
  final int id;
  final String? utcDate;
  final String? status;
  final int? matchday;
  final String? stage;
  final String? group;
  final String? lastUpdated;
  final TeamMatch homeTeam;
  final TeamMatch awayTeam;
  final Score score;
  final List<Referee> referees;

  const Match({
    required this.competition,
    required this.season,
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.referees,
  });

  Map<String, dynamic> toMap() {
    return {
      'competition': competition,
      'season': season,
      'id': id,
      'utcDate': utcDate,
      'status': status,
      'matchday': matchday,
      'stage': stage,
      'group': group,
      'lastUpdated': lastUpdated,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'score': score,
      'referees': referees,
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    List<dynamic> mapReferees = map['referees'] as List<dynamic>;
    List<Referee> referees = [];
    for(dynamic item in mapReferees){
      referees.add(Referee.fromMap(item));
    }

    return Match(
      competition: CompetitionMatch.fromMap(map['competition']) ,
      season:  Season.fromMap(map['season']),
      id: map['id'] as int,
      utcDate: map['utcDate'] as String?,
      status: map['status'] as String?,
      matchday: map['matchday'] as int?,
      stage: map['stage'] as String?,
      group: map['group'] as String?,
      lastUpdated: map['lastUpdated'] as String?,
      homeTeam: TeamMatch.fromMap(map['homeTeam']),
      awayTeam:TeamMatch.fromMap(map['awayTeam']),
      score: Score.fromMap(map['score']),
      referees: referees,
    );
  }
}