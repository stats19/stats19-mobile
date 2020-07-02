import 'package:meta/meta.dart';

import '../../domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel(
      {@required playerId,
      @required name,
      @required weight,
      @required height,
      @required age,
      @required playedMatches,
      @required fouls,
      @required redCards,
      @required yellowCards,
      @required shotOnTarget,
      @required score,
      @required goals,
      @required picture,
      @required countryName,
      @required countryPicture,
      @required teamPicture,
      @required teamId})
      : super(
            playerId: playerId,
            name: name,
            weight: weight,
            height: height,
            age: age,
            playedMatches: playedMatches,
            fouls: fouls,
            redCards: redCards,
            yellowCards: yellowCards,
            shotOnTarget: shotOnTarget,
            score: score,
            goals: goals,
            picture: picture,
            countryName: countryName,
            countryPicture: countryPicture,
            teamPicture: teamPicture,
            teamId: teamId);

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
        playerId: json['playerId'],
        name: json['name'],
        age: json['age'],
        weight: json['weight'],
        height: json['height'],
        playedMatches: json['playedMatches'],
        fouls: json['fouls'],
        redCards: json['redCards'],
        yellowCards: json['yellowCards'],
        shotOnTarget: json['shotOnTarget'],
        score: json['score'],
        goals: json['goals'],
        picture: json['picture'],
        countryName: json['countryName'],
        countryPicture: json['countryPicture'],
        teamPicture: json['teamPicture'],
        teamId: json['teamId']);
  }
}
