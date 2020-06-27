import 'package:meta/meta.dart';

import '../../domain/entities/matches_by_league.dart';

class MatchesByLeagueModel extends MatchesByLeague {
  MatchesByLeagueModel(
      {@required leagueId,
      @required leagueName,
      @required matches,
      @required playedMatches})
      : super(
            leagueId: leagueId,
            leagueName: leagueName,
            matches: matches,
            playedMatches: playedMatches);

  factory MatchesByLeagueModel.fromJson(Map<String, dynamic> json) {
    return MatchesByLeagueModel(
        leagueId: json['leagueId'],
        leagueName: json['leagueName'],
        matches: LeagueMatchModelList.fromJson(json['matches']).matches,
        playedMatches: PlayedMatchModelList.fromJson(json['playedMatches'])
            .playedMatchModels);
  }
}

class LeagueMatchModel extends LeagueMatch {
  LeagueMatchModel(
      {@required matchId,
      @required homeName,
      @required awayName,
      @required forecast,
      @required stage,
      @required date})
      : super(
            matchId: matchId,
            homeName: homeName,
            awayName: awayName,
            stage: stage,
            forecast: forecast,
            date: date);

  factory LeagueMatchModel.fromJson(Map<String, dynamic> json) {
    return LeagueMatchModel(
        matchId: json['matchId'],
        homeName: json['homeName'],
        awayName: json['awayName'],
        stage: json['step'],
        forecast: json['resultMatch'],
        date: json['date']);
  }
}

class LeagueMatchModelList {
  final List<LeagueMatchModel> matches;

  LeagueMatchModelList({@required this.matches});

  factory LeagueMatchModelList.fromJson(List<dynamic> parsedJson) {
    List<LeagueMatchModel> matches = new List<LeagueMatchModel>();
    matches = parsedJson == null
        ? parsedJson
        : parsedJson.map((i) => LeagueMatchModel.fromJson(i)).toList();

    return new LeagueMatchModelList(
      matches: matches,
    );
  }
}

class PlayedMatchModel extends PlayedMatch {
  PlayedMatchModel(
      {@required matchId, @required date, @required home, @required away})
      : super(matchId: matchId, date: date, home: home, away: away);

  factory PlayedMatchModel.fromJson(Map<String, dynamic> json) {
    return PlayedMatchModel(
        matchId: json['matchId'],
        date: json['date'],
        home: PlayedMatchTeamModel.fromJson(json['home']),
        away: PlayedMatchTeamModel.fromJson(json['away']));
  }
}

class PlayedMatchTeamModel extends PlayedMatchTeam {
  PlayedMatchTeamModel({@required teamId, @required name, @required goals})
      : super(teamId: teamId, name: name, goals: goals);

  factory PlayedMatchTeamModel.fromJson(Map<String, dynamic> json) {
    return PlayedMatchTeamModel(
        teamId: json['teamId'], name: json['name'], goals: json['goals']);
  }
}

class PlayedMatchModelList {
  final List<PlayedMatchModel> playedMatchModels;

  PlayedMatchModelList({@required this.playedMatchModels});

  factory PlayedMatchModelList.fromJson(List<dynamic> parsedJson) {
    List<PlayedMatchModel> playedMatchModels = new List<PlayedMatchModel>();
    playedMatchModels = parsedJson == null
        ? parsedJson
        : parsedJson.map((i) => PlayedMatchModel.fromJson(i)).toList();
    return new PlayedMatchModelList(
      playedMatchModels: playedMatchModels,
    );
  }
}
