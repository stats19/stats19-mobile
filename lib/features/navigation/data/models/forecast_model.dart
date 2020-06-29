import 'package:meta/meta.dart';

import '../../domain/entities/forecast.dart';
class ForecastModel extends Forecast {
  ForecastModel({
    @required success
  }): super(success: success);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        success: json['success']
    );
  }

}