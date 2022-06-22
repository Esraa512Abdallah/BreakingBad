import 'package:dio/dio.dart';

import '../../shared/constance/string_constance.dart';

class CharactersApi {
  Dio? dio;

  CharactersApi() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<List<dynamic>> getCharacter() async {
    try {
      Response? response = await dio?.get('characters');

   //   print(response!.data.toString());

      return response!.data;

    } catch (e) {
      print("get data error : $e ");

      return [] ;
    }
  }
}
