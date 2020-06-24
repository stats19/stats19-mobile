import 'package:stat19_app_mobile/features/navigation/domain/entities/forecast.dart';
import 'package:meta/meta.dart';
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