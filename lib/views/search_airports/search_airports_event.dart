part of 'search_airports_bloc.dart';

abstract class SearchAirportsEvent extends Equatable {
  const SearchAirportsEvent();

  @override
  List<Object> get props => [];
}

class SearchInitSuccess extends SearchAirportsEvent {
  const SearchInitSuccess();
}

class SearchByFilterEvent extends SearchAirportsEvent {
  final String inputText;

  @override
  List<Object> get props => [inputText];

  SearchByFilterEvent({@required this.inputText}) : assert(inputText != null);
}

class SearchByIataEvent extends SearchAirportsEvent {
  final inputText;

  @override
  List<Object> get props => [inputText];

  SearchByIataEvent({@required this.inputText}) : assert(inputText != null);
}

class SearchAirportsSubmitted extends SearchAirportsEvent {}

