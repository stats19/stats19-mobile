import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/team_model.dart';


abstract class TeamRemoteDataSource {
  Future<TeamModel> getTeam(int teamId, String season);
}

class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  TeamRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});

  @override
  Future<TeamModel> getTeam(int teamId, String season) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/teams/$teamId?season=$season',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return TeamModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}