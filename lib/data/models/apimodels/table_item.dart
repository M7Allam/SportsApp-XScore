import 'package:world_cup_qatar_2022/data/models/apimodels/team_match.dart';

class TableItem{

  final int position;
  final TeamMatch team;
  final int playedGames;
  final String? form;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  TableItem({
    required this.position,
    required this.team,
    required this.playedGames,
    required this.form,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
  });

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'team': team,
      'playedGames': playedGames,
      'form': form,
      'won': won,
      'draw': draw,
      'lost': lost,
      'points': points,
      'goalsFor': goalsFor,
      'goalsAgainst': goalsAgainst,
      'goalDifference': goalDifference,
    };
  }

  factory TableItem.fromMap(Map<String, dynamic> map) {
    return TableItem(
      position: map['position'] as int,
      team: TeamMatch.fromMap(map['team']),
      playedGames: map['playedGames'] as int,
      form: map['form'] as String?,
      won: map['won'] as int,
      draw: map['draw'] as int,
      lost: map['lost'] as int,
      points: map['points'] as int,
      goalsFor: map['goalsFor'] as int,
      goalsAgainst: map['goalsAgainst'] as int,
      goalDifference: map['goalDifference'] as int,
    );
  }
}