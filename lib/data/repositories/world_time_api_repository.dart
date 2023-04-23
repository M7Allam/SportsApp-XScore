import 'package:dio/dio.dart';
import 'package:world_cup_qatar_2022/data/services/world_time_api/world_time_api.dart';
import 'package:world_cup_qatar_2022/data/services/world_time_api/constants.dart';
import 'package:world_cup_qatar_2022/data/services/world_time_api/endpoints.dart';
import 'package:world_cup_qatar_2022/data/repositories/impl/world_time_api_repo_impl.dart';

class WorldTimeApiRepository with WorldTimeApiRepoImpl{

  final _api = WorldTimeApi();

  @override
  Future getTime() async{
    String query = '${WorldTimeApiConstants.baseUrl}${WorldTimeApiEndpoints.ip}';
    Response response = await _api.dio.get(query);
    return response.data;
  }

}