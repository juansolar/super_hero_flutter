import 'dart:convert';

import 'package:superhero_app/data/model/super_hero_response.dart';
import 'package:http/http.dart' as http;


class Repository {

  Future<SuperHeroResponse?> fetchSuperheroInfo(String name) async{

    final response = await http.get(Uri.parse(
      "https://superheroapi.com/api/17dc9219ac70dff94d6502adfd779a38/search/$name"
    ));

    if(response.statusCode == 200){
      var decodeJson = jsonDecode(response.body);
      SuperHeroResponse superHeroResponse = SuperHeroResponse.fromJson(decodeJson);
      return superHeroResponse;
    }else{
      return null;
    }

  }

}