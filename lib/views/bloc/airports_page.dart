import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/repositories/airports_repositories.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/views/bloc/airports_bloc.dart';

class AirportsPage extends StatefulWidget {
  final AirportsRepository airportsRepository;
  AirportsPage({this.airportsRepository});

  @override
  _AirportsPageState createState() => _AirportsPageState();
}

class _AirportsPageState extends State<AirportsPage> {
  final airportsBloc = AirportsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: BlocProvider(
      create: (context) => airportsBloc,
      child: BlocBuilder<AirportsBloc, AirportsState>(
      builder: (context, state) {
        if (state is AirportsInitial) {
          // return Container(
          //   child: FloatingActionButton(
          //   // onPressed: () =>state is AirportsFetching()
          //     child: Icon(
          //       Icons.search,
          //     ), 
          //     );
          // );
        } else if (state is AirportsEmpty) {
          return Expanded(
              child: Center(
            child: Text('No se encontró resultados'),
          ));
        } else if (state is AirportsFetching) {
          return Expanded(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is AirportsError) {
          Expanded(
              child: Center(
            child: Text('Se produjo un error'),
          ));
        } else {
          final stateAsAirportsFetched = state as AirportsFetchSuccess;
          final airports = stateAsAirportsFetched.airports;
          return buildAirports(airports);
        }
      },
    ),
    ))
    );
  }

  Widget buildAirports(List<Airport> airports) {
    return Expanded(
        child: ListView.builder(
          itemCount: airports.length ,
          itemBuilder: (BuildContext context, int index) {
      String iata = '${airports[index].iata}';
      return ListTile(
        leading: Text(
          "$index.   ${airports[index].name}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }));
  }
}
