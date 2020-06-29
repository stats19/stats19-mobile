import 'package:meta/meta.dart';

import '../../domain/entities/checked_process.dart';


class CheckedProcessModel extends CheckedProcess {
  CheckedProcessModel(
      {@required status,
      @required retry}
      ): super(status: status, retry: retry);

  factory CheckedProcessModel.fromJson(Map<String, dynamic> json) {
    return CheckedProcessModel(
      status: json['status'],
      retry: json['retry']
    );
  }
}