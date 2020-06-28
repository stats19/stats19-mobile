part of 'fantasy_bloc.dart';

abstract class FantasyState extends Equatable {
  const FantasyState();
}

class FantasyInitial extends FantasyState {
  @override
  List<Object> get props => [];
}
