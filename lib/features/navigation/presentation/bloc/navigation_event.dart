part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}


class RefreshForecastEvent extends NavigationEvent {
  @override
  List<Object> get props => [];

}