part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final List properties;
  UserState([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class Empty extends UserState {}

class Loading extends UserState {}

class Loaded extends UserState {
  final User user;
  Loaded({@required this.user});
}

class RegisterLoaded extends UserState {
  final User user;

  RegisterLoaded(this.user);
}

class Error extends UserState {
  final String message;

  Error({@required this.message});
}