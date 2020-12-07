import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:aiports_of_the_city/coordinators/main_coordinator.dart';
import 'package:aiports_of_the_city/repositories/distance_airports_repositories.dart';
import 'package:bloc/bloc.dart';

part 'distance_airports_event.dart';
part 'distance_airports_state.dart';

class DistanceAirportsBloc extends Bloc<DistanceAirportsEvent, DistanceAirportsState> {
  final DistanceAirportsRepository distanceRepository;
  final MainCoordinator coordinator;
  final BuildContext context;
  DistanceAirportsBloc({
    @required this.distanceRepository,
    @required this.coordinator,
    @required this.context
  }) : super(DistanceAirportsInitial());
  @override
  Stream<DistanceAirportsState> mapEventToState(
    DistanceAirportsEvent event,
  ) async* {
    yield DistanceFetchInProgress();
    Map<String, dynamic> distanceAirports;
    try{
      if (distanceAirports == null){
        yield DistanceAirportsInitial();
      }
      if(event is DistanceSearchEvent){
        distanceAirports = await distanceRepository.fetchDistance(inputOrigin: event.origin, inputDestination: event.destination);
      }
      else if(distanceAirports.length == 0){
        yield DistanceFetchEmpty();
      }
      else{
        DistanceFetchSuccess(distanceAirports: distanceAirports);
      }
    }catch(e){
      yield AirportsFetchError();
    }
  }
}
