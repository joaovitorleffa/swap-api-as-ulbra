import 'package:as_api/models/films.dart';
import 'package:as_api/models/swap.dart';
import 'package:dio/dio.dart';

class SwapRepository {
  final dio = Dio();

   Future<List<Swap>> fetchSwap() async {
      final url = 'https://swapi.dev/api/people/';

      final response = await dio.get(url);

      final list = response.data as Map<String, dynamic>;

      return (list['results'] as List)
        .map((e) => Swap.fromJson(e)).toList();
   }

   Future<List<Films>> fetchFilms() async {
      final url = 'https://swapi.dev/api/films/';

      final response = await dio.get(url);

      final list = response.data as Map<String, dynamic>;

      return (list['results'] as List)
        .map((e) => Films.fromJson(e)).toList();
   }
}