import 'dart:async';

import 'package:aiports_of_the_city/views/list_airports/airports_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'detail_airports_event.dart';
part 'detail_airports_state.dart';

class DetailAirportsBloc extends Bloc<DetailAirportsEvent, DetailAirportsState> {
  DetailAirportsBloc() : super(DetailAirportsFetchSuccess());

  @override
  Stream<DetailAirportsState> mapEventToState(
    DetailAirportsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
