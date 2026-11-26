class SuperHeroResponse {
  
  final String response;

  SuperHeroResponse({required this.response});

  factory SuperHeroResponse.fromJson(Map<String, dynamic> json){
    return SuperHeroResponse(response: json["response"]);
  }

}