import 'dart:async';

import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'search_airports_event.dart';
part 'search_airports_state.dart';

class SearchAirportsBloc extends Bloc<SearchAirportsEvent, SearchAirportsState> {
final AirportsSearchRepository airportsSearchRepository;
  
  String _inputText;
  
  SearchAirportsBloc({this.airportsSearchRepository}) : super(SearchAirportsInitial());

  @override
  SearchAirportsState get initialState => SearchAirportsInitial();

  @override
  Stream<SearchAirportsState> mapEventToState(
    SearchAirportsEvent event,
  ) async* {
    yield SearchAirportsFetching();
    List<Airport> airports;
    try {
      if (event is SearchByFilterEvent) {
        airports = await airportsSearchRepository.fetchByFilter(_inputText);
      }else if(event is SearchByIataEvent){
        airports = await airportsSearchRepository.fetchByIATA(_inputText);
      }
      if (airports.length == 0) {
        yield SearchAirportsEmpty();
      } else {
        yield SearchAirportsFetchSuccess(airports: airports);
      }
    } catch (_) {
      yield SearchAirportsError();
    }
  }
}