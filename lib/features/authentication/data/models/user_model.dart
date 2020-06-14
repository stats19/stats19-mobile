import 'package:flutter/cupertino.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({@required String username, @required String email})
      : super(username: username, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], email: json['email']);
  }

  Map<String, dynamic>  toJson() {
    return {
      'username': username,
      'email': email
    };
  }
}
