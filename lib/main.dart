import 'package:aiports_of_the_city/repositories/search_airports_repositories.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  AirportsSearchRepository _repository = AirportsSearchRepository();
  runApp(MyApp(airportsSearchRepository: _repository,));
}

class MyApp extends StatelessWidget {
  final AirportsSearchRepository airportsSearchRepository;
  MyApp({this.airportsSearchRepository});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: BlocProvider(create: (context) => SearchAirportsBloc(airportsSearchRepository: airportsSearchRepository)
        // ..add(SearchInitSuccessEvent())
        ,
        child: SearchAirportsPage(),)
        // home: BlocProvider(
        //   create: (context) => AirportsBloc(airportsRepository: airportsRepository)..add(AirportsEvent.loadSuccess),
        //   child: SearchAirportsPage(),
        // )
        );
  }
}
