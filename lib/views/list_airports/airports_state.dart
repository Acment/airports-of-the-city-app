part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  const AirportsState();

  @override
  List<Object> get props => [];
}

class AirportsInitial extends AirportsState {}

class AirportsFetching extends AirportsState {}

class AirportsFetchSuccess extends AirportsState {
  final List<Airport> airports;
  AirportsFetchSuccess({@required this.airports});
}

class AirportsEmpty extends AirportsState {}

class AirportsError extends AirportsState {}
