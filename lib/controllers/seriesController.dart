import 'package:amaris_test/models/series.dart';
import 'package:amaris_test/services/seriesService.dart';
import 'package:flutter/material.dart';

class SeriesController with ChangeNotifier {
  List<Series> populars = [];
  List<Series> recommendations = [];
  SerieServices serieService = SerieServices();
  List<Series> favorites = [];

  Future<void> loadPopulars() async {
    populars = await serieService.getPopular();
    notifyListeners();
  }

  Future<void> loadRecomendations() async {
    recommendations = await serieService.getRecommendation();
    notifyListeners();
  }

  addFavorite(Series serie) {
    favorites.add(serie);
    notifyListeners();
  }

  removeFavorite(Series serie) {
    favorites.remove(serie);
    notifyListeners();
  }
}
