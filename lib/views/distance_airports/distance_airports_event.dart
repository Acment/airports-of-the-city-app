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
  final String codeOrigin;
  final String destination;
  final String codeDestination;
  


  @override
  List<Object> get props => [origin, codeOrigin ,destination, codeDestination];

  DistanceSearchEvent({
    @required this.origin, 
    @required this.codeOrigin,
    @required this.destination,
    @required this.codeDestination
    });
}


