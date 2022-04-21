import 'dart:convert';

import 'package:amaris_test/models/series.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SerieServices {
  final apiKey = dotenv.get('API_KEY');

  Future<List<Series>> getPopular() async {
    var url =
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=1';
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    List<dynamic> aux = data["results"];
    List<Series> series = aux.map((e) => Series.fromMap(e)).toList();
    return series;
  }

  Future<List<Series>> getRecommendation() async {
    var url =
        'https://api.themoviedb.org/3/tv/92749/recommendations?api_key=$apiKey&language=en-US&page=1';
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    List<dynamic> aux = data["results"];
    List<Series> series = aux.map((e) => Series.fromMap(e)).toList();
    return series;
  }
}
