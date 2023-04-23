import 'package:world_cup_qatar_2022/data/models/apimodels/competition.dart' as apiCompetition;
import 'package:world_cup_qatar_2022/utils/enums/competition.dart';

class Competition{
  final int id;
  final int seasonId;
  final String name;
  final String code;
  final CompetitionType type;
  final String image;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final String? winner;

  const Competition({
    required this.id,
    required this.seasonId,
    required this.name,
    required this.code,
    required this.type,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    this.winner,
  });


  factory Competition.fromApi(apiCompetition.Competition apiCompetition) {
    return Competition(
      id: apiCompetition.id,
      seasonId: apiCompetition.currentSeason.id,
      name: apiCompetition.name,
      code: apiCompetition.code,
      type: apiCompetition.type == CompetitionType.CUP.name? CompetitionType.CUP: CompetitionType.LEAGUE,
      image: apiCompetition.emblem,
      startDate: apiCompetition.currentSeason.startDate!,
      endDate: apiCompetition.currentSeason.endDate!,
      currentMatchday: apiCompetition.currentSeason.currentMatchday,
      winner: apiCompetition.currentSeason.winner,
    );
  }
}