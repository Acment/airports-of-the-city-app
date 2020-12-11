import 'dart:async';

import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'detail_airports_event.dart';
part 'detail_airports_state.dart';

class DetailAirportsBloc extends Bloc<DetailAirportsEvent, DetailAirportsState> {

  final AirportsSearchRepository repository;
  final BuildContext context;
  
  DetailAirportsBloc({
    @required this.repository,
    @required this.context
  }) : super(DetailAirportsFetchInProgress());

  @override
  Stream<DetailAirportsState> mapEventToState(
    DetailAirportsEvent event,
  ) async* {
    yield DetailAirportsFetchInProgress();
    List<Airport> detailAirport;
    try{
      if (event is SearchDetailAirportsEvent){
        detailAirport = await repository.fetchByIATA(event.iata);

      }
      if(detailAirport == null){
        yield DetailAirportsFetchInProgress();
      }
      else{
        yield DetailAirportsFetchSuccess(airportDetail: detailAirport);
      }
    }catch(_){
      yield DetailAirportsFetchError();
    }
  }
}
