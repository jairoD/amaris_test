import 'dart:convert';

import 'package:flutter/foundation.dart';

class Series {
  String poster_path;
  int popularity;
  int id;
  String backdrop_path;
  int vote_average;
  String overview;
  String first_air_date;
  List<String> origin_country;
  List<int> genre_ids;
  String original_language;
  int vote_count;
  String name;
  String original_name;
  Series({
    required this.poster_path,
    required this.popularity,
    required this.id,
    required this.backdrop_path,
    required this.vote_average,
    required this.overview,
    required this.first_air_date,
    required this.origin_country,
    required this.genre_ids,
    required this.original_language,
    required this.vote_count,
    required this.name,
    required this.original_name,
  });

  Series copyWith({
    String? poster_path,
    int? popularity,
    int? id,
    String? backdrop_path,
    int? vote_average,
    String? overview,
    String? first_air_date,
    List<String>? origin_country,
    List<int>? genre_ids,
    String? original_language,
    int? vote_count,
    String? name,
    String? original_name,
  }) {
    return Series(
      poster_path: poster_path ?? this.poster_path,
      popularity: popularity ?? this.popularity,
      id: id ?? this.id,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      vote_average: vote_average ?? this.vote_average,
      overview: overview ?? this.overview,
      first_air_date: first_air_date ?? this.first_air_date,
      origin_country: origin_country ?? this.origin_country,
      genre_ids: genre_ids ?? this.genre_ids,
      original_language: original_language ?? this.original_language,
      vote_count: vote_count ?? this.vote_count,
      name: name ?? this.name,
      original_name: original_name ?? this.original_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'poster_path': poster_path,
      'popularity': popularity,
      'id': id,
      'backdrop_path': backdrop_path,
      'vote_average': vote_average,
      'overview': overview,
      'first_air_date': first_air_date,
      'origin_country': origin_country,
      'genre_ids': genre_ids,
      'original_language': original_language,
      'vote_count': vote_count,
      'name': name,
      'original_name': original_name,
    };
  }

  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      poster_path: map['poster_path'] ?? '',
      popularity: map['popularity']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      backdrop_path: map['backdrop_path'] ?? '',
      vote_average: map['vote_average']?.toInt() ?? 0,
      overview: map['overview'] ?? '',
      first_air_date: map['first_air_date'] ?? '',
      origin_country: List<String>.from(map['origin_country'] ?? const []),
      genre_ids: List<int>.from(map['genre_ids'] ?? const []),
      original_language: map['original_language'] ?? '',
      vote_count: map['vote_count']?.toInt() ?? 0,
      name: map['name'] ?? '',
      original_name: map['original_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Series.fromJson(String source) => Series.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Series(poster_path: $poster_path, popularity: $popularity, id: $id, backdrop_path: $backdrop_path, vote_average: $vote_average, overview: $overview, first_air_date: $first_air_date, origin_country: $origin_country, genre_ids: $genre_ids, original_language: $original_language, vote_count: $vote_count, name: $name, original_name: $original_name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Series &&
        other.poster_path == poster_path &&
        other.popularity == popularity &&
        other.id == id &&
        other.backdrop_path == backdrop_path &&
        other.vote_average == vote_average &&
        other.overview == overview &&
        other.first_air_date == first_air_date &&
        listEquals(other.origin_country, origin_country) &&
        listEquals(other.genre_ids, genre_ids) &&
        other.original_language == original_language &&
        other.vote_count == vote_count &&
        other.name == name &&
        other.original_name == original_name;
  }

  @override
  int get hashCode {
    return poster_path.hashCode ^
        popularity.hashCode ^
        id.hashCode ^
        backdrop_path.hashCode ^
        vote_average.hashCode ^
        overview.hashCode ^
        first_air_date.hashCode ^
        origin_country.hashCode ^
        genre_ids.hashCode ^
        original_language.hashCode ^
        vote_count.hashCode ^
        name.hashCode ^
        original_name.hashCode;
  }
}
