import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String username;
  final String email;

  User({
    @required this.username,
    @required this.email
  });

  @override
  List<Object> get props => [username, email];

  @override
  bool get stringify => true;


}