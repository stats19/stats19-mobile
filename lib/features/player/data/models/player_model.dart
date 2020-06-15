import 'package:flutter/cupertino.dart';
import 'package:stat19_app_mobile/features/player/domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel(
      {@required playerId, @required name, @required weight, @required height, @required birthday})
      : super(playerId: playerId, name: name, weight: weight, height: height, birthday: birthday);

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
        playerId: json['playerId'],
        name: json['name'],
        birthday: json['birthday'],
        weight: json['weight'],
        height: json['height']);
  }
}
