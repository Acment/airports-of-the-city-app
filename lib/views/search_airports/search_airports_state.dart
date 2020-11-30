part of 'search_airports_bloc.dart';

abstract class SearchAirportsState extends Equatable {
  const SearchAirportsState();
  
  @override
  List<Object> get props => [];
}

class SearchAirportsInitial extends SearchAirportsState {}

class SearchAirportsFetchInProgress extends SearchAirportsState{}

class SearchAirportsFetchSuccess extends SearchAirportsState{
  final List<Airport> airports;
  const SearchAirportsFetchSuccess({@required this.airports});

  @override
  List<Object> get props => [airports];
}

class SearchAirportsFetchEmpty extends SearchAirportsState{}

class SearchAirportsFetchError extends SearchAirportsState {}