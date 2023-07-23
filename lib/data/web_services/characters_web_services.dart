// ignore_for_file: avoid_print

import 'package:bloc_training/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 25),
      receiveTimeout: const Duration(seconds: 25),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print('dataaaaaaaaaaa ${response.data['results'].toString()}');
      return response.data['results'];
    } catch (e) {
      print('errorrrrrrrrr:   ${e.toString()}');
      return [];
    }
  }
}
