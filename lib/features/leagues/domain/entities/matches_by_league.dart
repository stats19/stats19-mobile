import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesByLeague extends Equatable {
  final int matchId;
  final String homeName;
  final String awayName;
  final String home;
  final String away;
  final String date;

  MatchesByLeague({
    @required this.matchId, 
    @required this.homeName, 
    @required this.awayName, 
    @required this.home, 
    @required this.away,
    @required this.date
  });

  @override
  List<Object> get props => [matchId, homeName, awayName, home, away, date];

  @override
  bool get stringify => true;


}