import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesByLeague extends Equatable {
  final int leagueId;
  final String leagueName;
  final List<LeagueMatch> matches;

  MatchesByLeague({
    @required this.leagueId, 
    @required this.leagueName, 
    @required this.matches
  });

  @override
  List<Object> get props => [leagueId, leagueName, matches];

  @override
  bool get stringify => true;
}

class LeagueMatch extends Equatable {
  final int matchId;
  final String homeName;
  final String awayName;
  final String date;

   LeagueMatch({
    @required this.matchId, 
    @required this.homeName, 
    @required this.awayName, 
    @required this.date
  });
  @override
  List<Object> get props => [matchId, homeName, awayName, date];

}