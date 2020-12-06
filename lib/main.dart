import 'package:aiports_of_the_city/coordinators/main_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/views/list_airports/airports_bloc.dart';
import 'package:aiports_of_the_city/views/list_airports/airports_page.dart';

import 'package:aiports_of_the_city/repositories/airports_repositories.dart';

void main() {
  AirportsRepository _repository = AirportsRepository();
  runApp(MyApp(airportsRepository: _repository));
}

class MyApp extends StatelessWidget {
  final AirportsRepository airportsRepository;
  MyApp({this.airportsRepository});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: BlocProvider(
          create: (context) => AirportsBloc(airportsRepository: airportsRepository, context: context, coordinator: MainCoordinator() )..add(AirportsEvent.loadSuccess, ),
          child: AirportsPage(),
        ));
  }
}
