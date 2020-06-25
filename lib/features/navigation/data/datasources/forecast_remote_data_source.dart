import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/core/config/constant.dart';
import 'package:stat19_app_mobile/core/error/exceptions.dart';
import 'package:stat19_app_mobile/features/navigation/data/models/checked_process_model.dart';
import 'package:stat19_app_mobile/features/navigation/data/models/forecast_model.dart';
import 'package:stat19_app_mobile/features/navigation/domain/entities/checked_process.dart';

abstract class ForecastRemoteDataSource {
  Future<ForecastModel> refreshForecast();
  Future<CheckedProcessModel> checkProcess();
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
      return new ForecastModel(success: true);
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CheckedProcessModel> checkProcess() async {
    final String token = this.sharedPreferences.getString(CACHED_AUTH_TOKEN);
    final response = await client.get(HOST + '/api/process/predict',
        headers: {'Content-Type': 'application/json', 'authorization': token});

    if (response.statusCode == 200) {
      return CheckedProcessModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}