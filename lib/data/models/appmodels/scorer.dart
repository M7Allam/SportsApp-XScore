import 'package:world_cup_qatar_2022/data/models/apimodels/scorer.dart' as apiScorer;
class Scorer{
  final int id;
  final String name;
  final String? teamLogo;
  final int goals;

  const Scorer({
    required this.id,
    required this.name,
    required this.teamLogo,
    required this.goals,
  });


  factory Scorer.fromApi(apiScorer.Scorer apiScorer) {
    return Scorer(
      id: apiScorer.player.id,
      name: apiScorer.player.name,
      teamLogo: apiScorer.team.crest,
      goals: apiScorer.goals,
    );
  }
}