part of 'detail_airports_bloc.dart';

abstract class DetailAirportsState extends Equatable {
  const DetailAirportsState();
  
  @override
  List<Object> get props => [];
}

class DetailAirportsFetchInProgress extends DetailAirportsState {}

class DetailAirportsFetchSuccess extends DetailAirportsState {
  final String iata;
  DetailAirportsFetchSuccess({@required this.iata});
}

class AirportsFetchError extends AirportsState {}