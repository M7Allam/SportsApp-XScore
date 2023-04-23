import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/score.dart' as apiScore;

class Score{
  final ScoreWinner? winner;
  final MatchDuration duration;
  late int? homeScore;
  late int? awayScore;
  late String? liveMinutes;

  Score({
    this.winner,
    required this.duration,
    this.homeScore,
    this.awayScore,
    this.liveMinutes,
  });


  factory Score.fromApi(apiScore.Score apiScore) {
    ScoreWinner winner = ScoreWinner.DRAW;
    if(apiScore.winner == ScoreWinner.HOME_TEAM.name) winner = ScoreWinner.HOME_TEAM;
    if(apiScore.winner == ScoreWinner.AWAY_TEAM.name) winner = ScoreWinner.AWAY_TEAM;
    return Score(
      winner: winner,
      duration: apiScore.duration == MatchDuration.REGULAR.name? MatchDuration.REGULAR: MatchDuration.UNKNOWN,
      homeScore: apiScore.fullTime.home,
      awayScore: apiScore.fullTime.away,
    );
  }
}