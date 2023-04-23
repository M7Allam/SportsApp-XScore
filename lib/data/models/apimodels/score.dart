import 'package:world_cup_qatar_2022/data/models/apimodels/match_score_duration.dart';

class Score{
  final String? winner;
  final String? duration;
  final MatchScoreDuration fullTime;
  final MatchScoreDuration halfTime;


  const Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'winner': winner,
      'duration': duration,
      'fullTime': fullTime,
      'halfTime': halfTime,
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      winner: map['winner'] as String?,
      duration: map['duration'] as String?,
      fullTime: MatchScoreDuration.fromMap(map['fullTime']),
      halfTime: MatchScoreDuration.fromMap(map['halfTime']),
    );
  }




}