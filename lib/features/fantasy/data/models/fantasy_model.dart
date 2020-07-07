import 'package:meta/meta.dart';

import '../../domain/entities/fantasy.dart';

class FantasyModel extends Fantasy {
  FantasyModel(
      {@required date,
      @required goalKeepers,
      @required defenders,
      @required middleFielders,
      @required forwards})
      : super(
            date: date,
            goalKeepers: goalKeepers,
            defenders: defenders,
            middleFielders: middleFielders,
            forwards: forwards);

  factory FantasyModel.fromJson(Map<String, dynamic> json) {
    return FantasyModel(
        date: json['date'],
        goalKeepers:
            FantasyPlayerModelList.fromJson(json['goalKeepers']).players,
        defenders: FantasyPlayerModelList.fromJson(json['defenders']).players,
        middleFielders:
            FantasyPlayerModelList.fromJson(json['middleFielders']).players,
        forwards: FantasyPlayerModelList.fromJson(json['forwards']).players);
  }
}

class FantasyPlayerModel extends FantasyPlayer {
  FantasyPlayerModel(
      {@required playerId,
      @required name,
      @required picture,
      @required leagueName,
      @required leagueId,
      @required leaguePicture,
      @required score,
      @required teamName,
      @required teamPicture,
      @required teamId})
      : super(
            playerId: playerId,
            name: name,
            picture: picture,
            leagueName: leagueName,
            leaguePicture: leaguePicture,
            leagueId: leagueId,
            score: score,
            teamName: teamName,
            teamPicture: teamPicture,
            teamId: teamId);

  factory FantasyPlayerModel.fromJson(Map<String, dynamic> json) {
    return FantasyPlayerModel(
        playerId: json['playerId'],
        name: json['name'],
        picture: json['picture'],
        leagueName: json['leagueName'],
        leagueId: json['leagueId'],
        score: json['score'],
        teamName: json['teamName'],
        teamId: json['teamId'],
        leaguePicture: json['leaguePicture'],
        teamPicture: json['teamPicture']);
  }
}

class FantasyPlayerModelList {
  final List<FantasyPlayerModel> players;

  FantasyPlayerModelList({@required this.players});

  factory FantasyPlayerModelList.fromJson(List<dynamic> parsedJson) {
    List<FantasyPlayerModel> players = new List<FantasyPlayerModel>();
    players = parsedJson.map((i) => FantasyPlayerModel.fromJson(i)).toList();

    return new FantasyPlayerModelList(
      players: players,
    );
  }
}
