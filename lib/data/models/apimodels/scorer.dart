import 'package:world_cup_qatar_2022/data/models/apimodels/player.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/team_match.dart';

class Scorer{
  final Player player;
  final TeamMatch team;
  final int goals;
  final int? assists;
  final int? penalties;

  const Scorer({
    required this.player,
    required this.team,
    required this.goals,
    this.assists,
    this.penalties,
  });

  Map<String, dynamic> toMap() {
    return {
      'player': player,
      'team': team,
      'goals': goals,
      'assists': assists,
      'penalties': penalties,
    };
  }

  factory Scorer.fromMap(Map<String, dynamic> map) {
    return Scorer(
      player:  Player.fromMap(map['player']),
      team: TeamMatch.fromMap(map['team']),
      goals: map['goals'] as int,
      assists: map['assists'] as int?,
      penalties: map['penalties'] as int?,
    );
  }
}