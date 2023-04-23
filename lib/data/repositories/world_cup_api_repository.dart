import 'package:dio/dio.dart';
import 'package:world_cup_qatar_2022/data/repositories/impl/world_cup_api_repo_impl.dart';
import 'package:world_cup_qatar_2022/data/services/world_cup_api/constants.dart';
import 'package:world_cup_qatar_2022/data/services/world_cup_api/endpoints.dart';
import 'package:world_cup_qatar_2022/data/services/world_cup_api/world_cup_api.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';

class WorldCupApiRepository with WorldCupApiRepoImpl{

  final _api = WorldCupApi();

  @override
  Future getCompetition(String apiKey) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}';
    Response response = await _api.dio.get(query);
    return response.data;
  }

  @override
  Future<List> getAllMatches(String apiKey) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}/${WorldCupApiEndpoints.matches}';
    Response response = await _api.dio.get(query);
    return response.data[WorldCupApiEndpoints.matches];
  }

  @override
  Future<List> getMatchesByDate(String apiKey, String date) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}/${WorldCupApiEndpoints.matches}';
    Response response = await _api.dio.get(
      query,
      queryParameters: {
        'dateFrom': date,
        'dateTo': date,
      },
    );

    return response.data[WorldCupApiEndpoints.matches] as List<dynamic>;
  }

  @override
  Future<List> getMatchesOfRound(String apiKey, Stages stage) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}/${WorldCupApiEndpoints.matches}';
    Response response = await _api.dio.get(
      query,
      queryParameters: {
        'stage' : stage.name,
      },
    );
    return response.data[WorldCupApiEndpoints.matches];
  }


  @override
  Future<List> getAllStandings(String apiKey) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}/${WorldCupApiEndpoints.standings}';
    Response response = await _api.dio.get(query);
    return response.data[WorldCupApiEndpoints.standings];
  }





  @override
  Future<List> getTopScorers(String apiKey) async{
    _dioOptionsCopyWithApiKey(apiKey);
    String query = '${WorldCupApiConstants.baseUrl}${WorldCupApiEndpoints.competitions}/${WorldCupApiConstants.worldCupId}/${WorldCupApiEndpoints.scorers}';
    Response response = await _api.dio.get(query);
    return response.data[WorldCupApiEndpoints.scorers];
  }

  void _dioOptionsCopyWithApiKey(String apiKey){
    _api.dio.options = _api.dio.options.copyWith(
      headers: {
        'X-Auth-Token' : apiKey,
      },
    );
  }

}