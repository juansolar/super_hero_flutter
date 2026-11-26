class SuperheroDetailsResponse {
  final String id;
  final String name;

  SuperheroDetailsResponse({required this.id, required this.name});

  factory SuperheroDetailsResponse.fromJson(Map<String, dynamic> json){
    return SuperheroDetailsResponse(id: json["id"], name: json["name"]);
  }

}