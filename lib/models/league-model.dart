class Leagues{
  String name;
  Leagues.fromjson(Map<String, dynamic> json):
        name = json["name"];
  Map<String, dynamic> toJson() =>
      {
        "name" : name
      };
  @override
  String toString(){
    return "{name:'${name}'}";
  }
}