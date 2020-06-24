import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/core/config/constant.dart';
import 'package:stat19_app_mobile/core/error/exceptions.dart';
import 'package:stat19_app_mobile/features/navigation/data/models/forecast_model.dart';

abstract class ForecastRemoteDataSource {
  Future<ForecastModel> refreshForecast();
}

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  ForecastRemoteDataSourceImpl({@required this.client, @required this.sharedPreferences});

  @override
  Future<ForecastModel> refreshForecast() async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.post(HOST + '/api/matches/forecast',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

}