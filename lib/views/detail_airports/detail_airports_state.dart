part of 'detail_airports_bloc.dart';

abstract class DetailAirportsState extends Equatable {
  const DetailAirportsState();
  
  @override
  List<Object> get props => [];
}

class DetailAirportsFetchInProgress extends DetailAirportsState {}

class DetailAirportsFetchSuccess extends DetailAirportsState {
  final List<Airport> airportDetail;
  DetailAirportsFetchSuccess({@required this.airportDetail});
}

class DetailAirportsFetchError extends DetailAirportsState {}