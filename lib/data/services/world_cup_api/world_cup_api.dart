import 'package:dio/dio.dart';
import 'package:world_cup_qatar_2022/data/services/world_cup_api/constants.dart';

class WorldCupApi{
  late Dio dio;

  WorldCupApi(){
    BaseOptions options = BaseOptions(
      baseUrl: WorldCupApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }

}