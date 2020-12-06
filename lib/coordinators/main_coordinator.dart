import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
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

  MaterialPageRoute _createRoute(Widget page) {
    return MaterialPageRoute(builder: (BuildContext context) => page);
  }
}