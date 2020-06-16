part of 'soccer_search_bloc.dart';

abstract class SoccerSearchEvent extends Equatable {
  const SoccerSearchEvent();
}

class GetSoccerSearchEvent extends SoccerSearchEvent {
  final String searchStr;

  GetSoccerSearchEvent(this.searchStr);

  @override
  List<Object> get props => [searchStr];
}
