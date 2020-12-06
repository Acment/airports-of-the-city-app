part of 'distance_airports_bloc.dart';

abstract class DistanceAirportsEvent extends Equatable {
  const DistanceAirportsEvent();

  @override
  List<Object> get props => [];
}

// class DistanceInitSuccessEvent extends DistanceAirportsEvent{
//   const DistanceInitSuccessEvent();
// }

class DistanceSearchEvent extends DistanceAirportsEvent {
  final List<String> routeText;

  @override
  List<Object> get props => [routeText];

  DistanceSearchEvent({@required this.routeText}) : assert(routeText != null);
}
