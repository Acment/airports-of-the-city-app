import 'package:aiports_of_the_city/repositories/distance_airports_repositories.dart';
import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
import 'package:aiports_of_the_city/views/detail_airports/detail_airports_bloc.dart';
import 'package:aiports_of_the_city/views/detail_airports/detail_airports_page.dart';
import 'package:aiports_of_the_city/views/distance_airports/distance_airports_bloc.dart';
import 'package:aiports_of_the_city/views/distance_airports/distance_airports_page.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCoordinator {
  void launchSearch(BuildContext context) {
    Navigator.of(context).push(
      _createRoute(_createSearchPage()),
    );
  }

  void launchDistance(BuildContext context) {
    Navigator.of(context).push(
      _createRoute(_createDistancePage())
    );
  }

  void launchDetail(BuildContext context, iata) {
    Navigator.of(context).push(
      _createRoute(_createDetailPage(iata))
    );
  }

  BlocProvider<DistanceAirportsBloc> _createDistancePage(){
    return BlocProvider<DistanceAirportsBloc>(create: (BuildContext context) => DistanceAirportsBloc(
      coordinator: this,
      distanceRepository: DistanceAirportsRepository(),
      context: context
      
    )..add(DistanceInitSuccessEvent()),
    child: DistanceAirportsPage(),
    );
    
  }

  BlocProvider<SearchAirportsBloc> _createSearchPage(){
    return BlocProvider<SearchAirportsBloc>(create: (BuildContext context) => SearchAirportsBloc(
      coordinator: this,
      context: context,
      airportsSearchRepository: AirportsSearchRepository(),
      // TODO DELETE UNNECESARY ADD 
    )..add(SearchInitSuccessEvent()),
      child: SearchAirportsPage(),
    );

  }

  BlocProvider<DetailAirportsBloc> _createDetailPage(iata){
    return BlocProvider<DetailAirportsBloc>(create: (BuildContext context) => DetailAirportsBloc(
      context: context, 
      repository: AirportsSearchRepository(),
      )..add(SearchDetailAirportsEvent(iata: iata)),
      child: DetailAirportsPage(),
      );
  }

  MaterialPageRoute _createRoute(Widget page) {
    return MaterialPageRoute(builder: (BuildContext context) => page);
  }
}
