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

  SearchAirportsBloc({this.airportsSearchRepository}) : super(SearchAirportsInitial());

  @override
  SearchAirportsState get initialState => SearchAirportsInitial();

  @override
  Stream<SearchAirportsState> mapEventToState(
    SearchAirportsEvent event,
  ) async* {
    yield SearchAirportsInFetch();
    List<Airport> airports;
    try {
      if (event is SearchInitSuccessEvent ) {
        yield SearchAirportsInitial();
      }else if(event is SearchByIataEvent){
        print(event.inputText);
        airports = await airportsSearchRepository.fetchByIATA(event.inputText);
      }else if( event is SearchByFilterEvent){
        airports = await airportsSearchRepository.fetchByFilter(event.inputText);
      }
      if (airports.length == 0) {
        yield SearchAirportsEmpty();
      }
      
      // else if(event is SearchGeneralEvent){
      //   yield SearchAirportsGeneral();
      // } else if (event is SearchIataEvent){
      //   yield SearchAirportsIATA();
      // }
      else {
        yield SearchAirportsFetchSuccess(airports: airports);
      }
    } catch (_) {
      yield SearchAirportsError();
    }
  }
}