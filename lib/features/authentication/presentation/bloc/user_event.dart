part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}


class UserLogin extends UserEvent {
  final String  username;
  final String password;

  UserLogin(this.username, this.password);
  @override
  List<Object> get props => [username, password];
}

class RegisterEvent extends UserEvent {
  final String username;
  final String email;
  final String password;

  RegisterEvent({this.username, this.email, this.password});
  @override
  List<Object> get props => [username, email, password];

}