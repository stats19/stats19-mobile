import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SoccerSearch extends Equatable {
  final List<SoccerSearchResult> teams;
  final List<SoccerSearchResult> players;

  SoccerSearch(
      {@required this.teams,
      @required this.players});

  @override
  List<Object> get props => [teams, players];

  @override
  bool get stringify => true;
}

class SoccerSearchResult extends Equatable {
  final int id;
  final String name;

  SoccerSearchResult(
      {@required this.id,
      @required this.name});

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}