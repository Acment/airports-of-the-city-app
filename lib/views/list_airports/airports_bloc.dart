import 'dart:async';

import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/repositories/airports_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'airports_event.dart';
part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  final AirportsRepository airportsRepository;
  AirportsBloc({this.airportsRepository}) : super(AirportsFetching());

  @override
  AirportsState get initialState => AirportsFetching();

  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    yield AirportsFetching();
    List<Airport> airports;
    try {
      if (event == AirportsEvent.loadSuccess) {
        airports = await airportsRepository.fetchAllAirports();
      }
      if (airports.length == 0) {
        yield AirportsEmpty();
      } else {
        yield AirportsFetchSuccess(airports: airports);
      }
    } catch (_) {
      yield AirportsError();
    }
  }
}
