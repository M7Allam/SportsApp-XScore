import 'package:world_cup_qatar_2022/data/models/appmodels/score.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/team.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/match.dart' as apiMatch;
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/utils/general_methods.dart';

class Match{
  final int id;
  final int competitionId;
  late DateTime? dateTime;
  late MatchStatus status;
  final int? matchday;
  final Stages stage;
  final Groups? group;
  final String? lastUpdated;
  final Team homeTeam;
  final Team awayTeam;
  late Score score;


  Match({
    required this.id,
    required this.competitionId,
    required this.dateTime,
    required this.status,
    this.matchday,
    required this.stage,
    this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
  });


  factory Match.fromApi(apiMatch.Match apiMatch) {
    return Match(
      id: apiMatch.id,
      competitionId: apiMatch.competition.id,
      dateTime: formatDateTime(apiMatch.utcDate),
      status: getMatchStatus(apiMatch.status!),
      matchday: apiMatch.matchday,
      stage: getStage(apiMatch.stage!),
      group: getGroup(apiMatch.group),
      lastUpdated: apiMatch.lastUpdated,
      homeTeam: Team.fromApi(apiMatch.homeTeam),
      awayTeam: Team.fromApi(apiMatch.awayTeam),
      score: Score.fromApi(apiMatch.score),
    );
  }

}
