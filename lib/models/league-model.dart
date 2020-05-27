class Leagues{
  String name;
  int leagueId;
  String country;
  String matches;
  String teams;

  Leagues({this.name, this.leagueId, this.country, this.matches, this.teams});

//  Leagues.fromjson(Map<String, dynamic> json): name = json["name"];
  Map<String, dynamic> toJson() => {"name" : name };
  factory Leagues.fromjson(Map<String, dynamic> json){
    print('ici cest paris');
    print(json);
    return Leagues(
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
  final List<Leagues> leagues;

  LeaguesList({
    this.leagues
  });

  factory LeaguesList.fromJson(List<dynamic> parsedJson) {

    List<Leagues> league = new List<Leagues>();

    return new LeaguesList(
      leagues: league,
    );
  }

}