import 'package:meta/meta.dart';

import '../../domain/entities/team.dart';

class TeamModel extends Team {
  TeamModel(
      {@required teamId,
      @required name,
      @required shortName,
      @required picture,
      @required matchesPlayed,
      @required league,
      @required matchesWin,
      @required matchesDraw,
      @required matchesLose,
      @required homeWin,
      @required awayWin,
      @required goals,
      @required goalsConceded,
      @required foul,
      @required recentMatches,
      @required playedMatches,
      @required nextMatches})
      : super(
            teamId: teamId,
            name: name,
            shortName: shortName,
            picture: picture,
            league: league,
            matchesPlayed: matchesPlayed,
            matchesWin: matchesWin,
            matchesDraw: matchesDraw,
            matchesLose: matchesLose,
            homeWin: homeWin,
            awayWin: awayWin,
            goals: goals,
            goalsConceded: goalsConceded,
            foul: foul,
            recentMatches: recentMatches,
            playedMatches: playedMatches,
            nextMatches: nextMatches);

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
        teamId: json['teamId'],
        name: json['name'],
        picture: json['picture'],
        shortName: json['shortName'],
        matchesPlayed: json['matchesPlayed'],
        league: TeamLeagueModel.fromJson(json['league']),
        matchesWin: json['matchesWin'],
        matchesDraw: json['matchesDraw'],
        matchesLose: json['matchesLose'],
        homeWin: json['homeWin'],
        awayWin: json['awayWin'],
        goals: json['goals'],
        goalsConceded: json['goalsConceded'],
        foul: json['foul'],
        recentMatches: RecentMatchModelList.fromJson(json['recentMatches'])
            .recentMatchModels,
        playedMatches: PlayedMatchModelList.fromJson(json['playedMatches'])
            .playedMatchModels,
        nextMatches:
            NextMatchModelList.fromJson(json['nextMatches']).nextMatchModels);
  }
}

class TeamLeagueModel extends TeamLeague {
  TeamLeagueModel({@required leagueId, @required name, @required leaguePicture})
      : super(leagueId: leagueId, name: name, leaguePicture: leaguePicture);

  factory TeamLeagueModel.fromJson(Map<String, dynamic> json) {
    return TeamLeagueModel(
        leagueId: json['leagueId'],
        name: json['leagueName'],
        leaguePicture: json['leaguePicture']);
  }
}

class RecentMatchModel extends RecentMatch {
  RecentMatchModel({@required matchId, @required result})
      : super(matchId: matchId, result: result);

  factory RecentMatchModel.fromJson(Map<String, dynamic> json) {
    return RecentMatchModel(
        matchId: json['matchId'], result: json['resultMatch']);
  }
}

class RecentMatchModelList {
  final List<RecentMatchModel> recentMatchModels;

  RecentMatchModelList({@required this.recentMatchModels});

  factory RecentMatchModelList.fromJson(List<dynamic> parsedJson) {
    List<RecentMatchModel> recentMatchModels = new List<RecentMatchModel>();
    recentMatchModels =
        parsedJson.map((i) => RecentMatchModel.fromJson(i)).toList();
    return new RecentMatchModelList(
      recentMatchModels: recentMatchModels,
    );
  }
}

class PlayedMatchModel extends PlayedMatch {
  PlayedMatchModel(
      {@required matchId,
      @required date,
      @required result,
      @required forecast,
      @required home,
      @required away})
      : super(
            matchId: matchId,
            date: date,
            result: result,
            home: home,
            away: away,
            forecast: forecast);

  factory PlayedMatchModel.fromJson(Map<String, dynamic> json) {
    return PlayedMatchModel(
        matchId: json['matchId'],
        date: json['date'],
        result: json['resultMatch'],
        forecast: json['forecast'],
        home: PlayedMatchTeamModel.fromJson(json['home']),
        away: PlayedMatchTeamModel.fromJson(json['away']));
  }
}

class PlayedMatchTeamModel extends PlayedMatchTeam {
  PlayedMatchTeamModel(
      {@required teamId, @required name, @required goals, @required picture})
      : super(teamId: teamId, name: name, goals: goals, picture: picture);

  factory PlayedMatchTeamModel.fromJson(Map<String, dynamic> json) {
    return PlayedMatchTeamModel(
        teamId: json['teamId'],
        name: json['name'],
        goals: json['goals'],
        picture: json['picture']);
  }
}

class PlayedMatchModelList {
  final List<PlayedMatchModel> playedMatchModels;

  PlayedMatchModelList({@required this.playedMatchModels});

  factory PlayedMatchModelList.fromJson(List<dynamic> parsedJson) {
    List<PlayedMatchModel> playedMatchModels = new List<PlayedMatchModel>();
    playedMatchModels =
        parsedJson.map((i) => PlayedMatchModel.fromJson(i)).toList();
    return new PlayedMatchModelList(
      playedMatchModels: playedMatchModels,
    );
  }
}

class NextMatchModel extends NextMatch {
  NextMatchModel(
      {@required date,
      @required stage,
      @required homeTeam,
      @required awayTeam,
      @required homeTeamId,
      @required awayTeamId,
      @required homePicture,
      @required awayPicture,
      @required forecastMatch})
      : super(
            date: date,
            stage: stage,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            homeTeamId: homeTeamId,
            awayTeamId: awayTeamId,
            forecastMatch: forecastMatch,
            homePicture: homePicture,
            awayPicture: awayPicture);

  factory NextMatchModel.fromJson(Map<String, dynamic> json) {
    return NextMatchModel(
        date: json['date'],
        stage: json['stage'],
        homeTeam: json['homeTeam'],
        awayTeam: json['awayTeam'],
        homeTeamId: json['homeTeamId'],
        awayTeamId: json['awayTeamId'],
        homePicture: json['homePicture'],
        awayPicture: json['awayPicture'],
        forecastMatch: json['forecastMatch']);
  }
}

class NextMatchModelList {
  final List<NextMatchModel> nextMatchModels;

  NextMatchModelList({@required this.nextMatchModels});

  factory NextMatchModelList.fromJson(List<dynamic> parsedJson) {
    List<NextMatchModel> nextMatchModels = new List<NextMatchModel>();
    nextMatchModels =
        parsedJson.map((i) => NextMatchModel.fromJson(i)).toList();
    return new NextMatchModelList(
      nextMatchModels: nextMatchModels,
    );
  }
}
