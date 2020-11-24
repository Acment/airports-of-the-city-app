import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/views/bloc/airports_bloc.dart';
import 'package:aiports_of_the_city/repositories/airports_repositories.dart';
import 'package:aiports_of_the_city/views/bloc/airports_page.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: BlocProvider(
          create: (context) => AirportsBloc(),
          child: AirportsPage(airportsRepository: airportsRepository),
        ));
  }
}
