class SuperheroDetailsResponse {
  final String id;
  final String name;
  final String url;
  final String realName;
  final SuperheroStatsResponse superheroStatsResponse;

  SuperheroDetailsResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.realName,
    required this.superheroStatsResponse
  });

  factory SuperheroDetailsResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailsResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      realName: json["biography"]["full-name"],
      superheroStatsResponse: SuperheroStatsResponse.fromJson(json["powerstats"])
    );
  }
}

class SuperheroStatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  SuperheroStatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory SuperheroStatsResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroStatsResponse(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }
}
