import 'package:world_cup_qatar_2022/data/models/apimodels/team_match.dart';

class Team{
  final int? id;
  final String? fullName;
  final String? shortName;
  final String? codeName;
  final String? logo;

  const Team({
    this.id,
    this.fullName,
    this.shortName,
    this.codeName,
    this.logo,
  });

  factory Team.fromApi(TeamMatch apiTeamMatch) {
    return Team(
      id: apiTeamMatch.id,
      fullName: apiTeamMatch.name,
      shortName: apiTeamMatch.shortName,
      codeName: apiTeamMatch.tla,
      logo: apiTeamMatch.crest,
    );
  }
}