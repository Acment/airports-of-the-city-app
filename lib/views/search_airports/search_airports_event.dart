part of 'search_airports_bloc.dart';

abstract class SearchAirportsEvent extends Equatable {
  
  const SearchAirportsEvent();

  @override
  List<Object> get props => [];
}

// class SearchGeneralEvent extends SearchAirportsEvent{}
// class SearchIataEvent extends SearchAirportsEvent{}

// TODO Delete searchInitSuccese cause is unnecesary
class SearchInitSuccessEvent extends SearchAirportsEvent {
  const SearchInitSuccessEvent();
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
