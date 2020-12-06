import 'dart:async';

import 'package:aiports_of_the_city/coordinators/main_coordinator.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/repositories/airports_repositories.dart';
import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'airports_event.dart';
part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  MainCoordinator coordinator;
  
  final AirportsRepository airportsRepository;
  // final AirportsSearchRepository airportsSearchRepository;
  final BuildContext context;

  AirportsBloc({
    @required this.airportsRepository,
    // @required this.airportsSearchRepository,
    @required this.context,
    @required this.coordinator,
    }) : super(AirportsFetchInProgress());


  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    yield AirportsFetchInProgress();
    List<Airport> airports;
    try {
      if (event == AirportsEvent.loadSuccess) {
        airports = await airportsRepository.fetchAllAirports();
      } else if (event == AirportsEvent.searchPageSelected ){
        coordinator.launchSearch(context );
      }
      if (airports == null) {
        yield AirportsFetchEmpty();
      }
      else {
        yield AirportsFetchSuccess(airports: airports);
      }
    } catch (_) {
      print(_);
      yield AirportsFetchError();
    }
  }
}
