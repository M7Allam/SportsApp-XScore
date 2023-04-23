import 'package:world_cup_qatar_2022/data/models/apimodels/standing.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/match.dart';
import 'package:world_cup_qatar_2022/utils/general_methods.dart';

class RoundStanding{
  final Stages stage;
  final List<Match> matches;

  const RoundStanding({
    required this.stage,
    required this.matches,
  });


  factory RoundStanding.fromApi(Standing standing) {
    return RoundStanding(
      stage: getStage(standing.stage),
      matches: [],
    );
  }
}