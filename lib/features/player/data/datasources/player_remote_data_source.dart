import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/player_model.dart';

abstract class PlayerRemoteDataSouce {
  Future<PlayerModel> getPlayer(int playerId);
}


class PlayerRemoteDataSourceImpl extends PlayerRemoteDataSouce {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  PlayerRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});

  @override
  Future<PlayerModel> getPlayer(int playerId) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/players/$playerId',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return PlayerModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

}