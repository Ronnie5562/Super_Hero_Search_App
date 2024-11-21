import "package:super_hero_app/api/constants.dart";
import 'package:super_hero_app/model/hero_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SuperHeroApi {
  final String baseUrl = "https://superheroapi.com/api.php/$superHeroApikey";

  Future<List<HeroListModel>> getHeroesList(String query) async {
    final String heroesListUrl = "$baseUrl/search/$query";
    final response = await http.get(Uri.parse(heroesListUrl));

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["results"];

      Iterable list = result;
      return list.map((hero) => HeroListModel.fromMap(hero)).toList();
    } else {
      throw Exception("Failed to load heroes list");
    }
  }

  Future<HeroDetailModel> getHeroDetails(String id) async {
    final String heroDetailsUrl = "$baseUrl/$id";
    final response = await http.get(Uri.parse(heroDetailsUrl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return HeroDetailModel.fromMap(result);
    } else {
      throw Exception("Failed to load hero details for ID: $id");
    }
  }
}
