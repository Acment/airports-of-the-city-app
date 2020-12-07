part of 'distance_airports_bloc.dart';

abstract class DistanceAirportsEvent extends Equatable {
  const DistanceAirportsEvent();

  @override
  List<Object> get props => [];
}

class DistanceInitSuccessEvent extends DistanceAirportsEvent{
  const DistanceInitSuccessEvent();
}

class DistanceSearchEvent extends DistanceAirportsEvent {
  final String origin;
  final String destination;


  @override
  List<Object> get props => [origin, destination];

  DistanceSearchEvent({@required this.origin, @required this.destination});
}
