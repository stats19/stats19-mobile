import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class League extends Equatable {
  final int leagueId;
  final String name;
  final String country;
  final String matches;
  final String teams;
  final String picture;

  League({
    @required this.leagueId, 
    @required this.name, 
    @required this.country, 
    @required this.matches, 
    @required this.teams,
    @required this.picture
  });

  @override
  List<Object> get props => [leagueId, name, country, matches, teams];

  @override
  bool get stringify => true;


}