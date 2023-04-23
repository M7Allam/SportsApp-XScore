import 'package:dio/dio.dart';
import 'package:world_cup_qatar_2022/data/services/world_time_api/constants.dart';

class WorldTimeApi{
  late Dio dio;

  WorldTimeApi(){
    BaseOptions options = BaseOptions(
      baseUrl: WorldTimeApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }
}