import 'package:world_cup_qatar_2022/utils/enums/stages.dart';

abstract class WorldCupApiRepoImpl{

  Future<dynamic> getCompetition(String apiKey);

  Future<List<dynamic>> getAllMatches(String apiKey);

  Future<List<dynamic>> getMatchesByDate(String apiKey, String date);

  Future<List<dynamic>> getAllStandings(String apiKey);

  Future<List<dynamic>> getMatchesOfRound(String apiKey, Stages stage);

  Future<List<dynamic>> getTopScorers(String apiKey);


}