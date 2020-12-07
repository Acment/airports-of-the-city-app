import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'distance_airports_event.dart';
part 'distance_airports_state.dart';

class DistanceAirportsBloc extends Bloc<DistanceAirportsEvent, DistanceAirportsState> {
  DistanceAirportsBloc() : super(DistanceAirportsInitial());
  // TODO add DistanceRepositoryAs a parameter
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
        // TODO create repository and api cliente
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
