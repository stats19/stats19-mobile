import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CheckedProcess extends Equatable {
  final String status;
  final bool retry;

  CheckedProcess({@required this.status, @required this.retry});

  @override
  List<Object> get props => [status, retry];
}