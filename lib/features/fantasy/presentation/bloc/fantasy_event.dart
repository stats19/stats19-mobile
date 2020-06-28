part of 'fantasy_bloc.dart';

abstract class FantasyEvent extends Equatable {
  const FantasyEvent();
}

class GetFantasyEvent extends FantasyEvent {
  @override
  List<Object> get props => [];
}
