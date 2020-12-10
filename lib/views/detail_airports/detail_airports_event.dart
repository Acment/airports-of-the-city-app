part of 'detail_airports_bloc.dart';

abstract class DetailAirportsEvent extends Equatable {
  const DetailAirportsEvent();

  @override
  List<Object> get props => [];
}

class SearchDetailAirportsEvent extends DetailAirportsEvent {
  final String iata;

  @override
  List<Object> get props => [iata];

  SearchDetailAirportsEvent({@required this.iata});
}
