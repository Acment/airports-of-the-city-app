part of 'search_airports_bloc.dart';

abstract class SearchAirportsState extends Equatable {
  const SearchAirportsState();
  
  @override
  List<Object> get props => [];
}

class SearchAirportsInitial extends SearchAirportsState {}

class SearchAirportsFetching extends SearchAirportsState{}

class SearchAirportsFetchSuccess extends SearchAirportsState{
  final List<Airport> airports;
  SearchAirportsFetchSuccess({@required this.airports});
}

class SearchAirportsEmpty extends SearchAirportsState{}

class SearchAirportsError extends SearchAirportsState {}