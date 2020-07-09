part of 'fantasy_bloc.dart';

abstract class FantasyState extends Equatable {
  const FantasyState();
}

class FantasyInitial extends FantasyState {
  @override
  List<Object> get props => [];
}

class Loading extends FantasyState {
  @override
  List<Object> get props => [];
}

class Loaded extends FantasyState {
  final Fantasy fantasy;
  final int page;
  final bool hasReachedMax;

  Loaded({@required this.fantasy, @required this.hasReachedMax, this.page});

  Loaded copyWith({Fantasy fantasy, bool hasReachedMax, int page}) {
    return Loaded(
        fantasy: fantasy ?? this.fantasy,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax, page: page ?? this.page);
  }

  @override
  List<Object> get props => [fantasy];
}

class Error extends FantasyState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
