import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_router.dart';
import '../../../../core/config/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../models/fantasy_model.dart';

abstract class FantasyRemoteDataSource {
  Future<FantasyModel> getFantasyPlayers(int page);
}


class FantasyRemoteDataSourceImpl extends FantasyRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  FantasyRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});

  @override
  Future<FantasyModel> getFantasyPlayers(int page) async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/players/fantasy?page=$page',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return FantasyModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      routing(RouteSettings(name: NamedRoute.CONNECTION_ROUTE));
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}