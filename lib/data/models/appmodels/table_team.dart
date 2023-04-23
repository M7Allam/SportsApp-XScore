import 'package:world_cup_qatar_2022/data/models/appmodels/team.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/table_item.dart' as apiTableTeam;

class TableTeam{
  final Team team;
  final int position;
  final int played;
  final int won;
  final int draw;
  final int lost;
  final int pts;
  final int GF;
  final int GA;
  final int GD;
  late bool isInLiveMatch;

  TableTeam({
    required this.team,
    required this.position,
    required this.played,
    required this.won,
    required this.draw,
    required this.lost,
    required this.pts,
    required this.GF,
    required this.GA,
    required this.GD,
    this.isInLiveMatch = false,
  });


  factory TableTeam.fromApi(apiTableTeam.TableItem apiTableTeam) {
    return TableTeam(
      team: Team.fromApi(apiTableTeam.team),
      position: apiTableTeam.position,
      played: apiTableTeam.playedGames,
      won: apiTableTeam.won,
      draw: apiTableTeam.draw,
      lost: apiTableTeam.lost,
      pts: apiTableTeam.points,
      GF: apiTableTeam.goalsFor,
      GA: apiTableTeam.goalsAgainst,
      GD: apiTableTeam.goalDifference,
      isInLiveMatch: false,
    );
  }
}