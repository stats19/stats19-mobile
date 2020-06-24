part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationInitial extends NavigationState {
  @override
  List<Object> get props => [];
}

class Loading extends NavigationState {
  @override
  List<Object> get props => [];
}

class Loaded extends NavigationState {
  @override
  List<Object> get props => [];
}

class Error extends NavigationState {
  final String message;

  Error({this.message});

  @override
  List<Object> get props => [message];
}