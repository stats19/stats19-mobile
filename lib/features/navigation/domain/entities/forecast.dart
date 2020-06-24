import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Forecast extends Equatable {
  final bool success;

  Forecast({
    @required this.success
  });

  @override
  List<Object> get props => [success];

  @override
  bool get stringify => true;


}