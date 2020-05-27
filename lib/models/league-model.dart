class League{
  String name;
  int leagueId;
  String country;
  String matches;
  String teams;

  League({this.name, this.leagueId, this.country, this.matches, this.teams});

//  Leagues.fromjson(Map<String, dynamic> json): name = json["name"];
  Map<String, dynamic> toJson() => {"name" : name };
  factory League.fromJson(Map<String, dynamic> json){
    return League(
      name: json['name'],
      leagueId: json['leagueId'],
      country: json['country'],
      matches: json['matches'],
      teams: json['teams']
    );
  }


  @override
  String toString(){
    return "{name:'${name}'}";
  }
}

class LeaguesList{
  final List<League> leagues;

  LeaguesList({
    this.leagues
  });

  factory LeaguesList.fromJson(List<dynamic> parsedJson) {

    List<League> leagues = new List<League>();
    leagues = parsedJson.map((i)=>League.fromJson(i)).toList();


    return new LeaguesList(
      leagues: leagues,
    );
  }

}