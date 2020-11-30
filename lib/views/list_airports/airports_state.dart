part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  const AirportsState();

  @override
  List<Object> get props => [];
}


class AirportsFetchInProgress extends AirportsState {}

class AirportsFetchSuccess extends AirportsState {
  final List<Airport> airports;
  AirportsFetchSuccess({@required this.airports});
}

class AirportsFetchEmpty extends AirportsState {}

class AirportsFetchError extends AirportsState {}
