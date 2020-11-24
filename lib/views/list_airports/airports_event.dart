part of 'airports_bloc.dart';

abstract class AirportsEvent {}

class AllAirportsEvent extends AirportsEvent {}

// class OneAirportEvent {
//   final String airportId;
//   OneAirportEvent({@required this.airportId}) : assert(airportId != null);
// }
