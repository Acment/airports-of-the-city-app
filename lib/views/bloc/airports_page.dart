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
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<AirportsBloc, AirportsState>(
          builder: (context, state) {
            if (state is AirportsInitial){
              return Scaffold(
                floatingActionButton: FloatingActionButton(child: Icon(Icons.search), onPressed: ()=> searchAirports ),
              );
            }else if(state is AirportsFetching){
              return Expanded(
                child: CircularProgressIndicator(
                ),
              );
            }else if (state is AirportsFetchSuccess){
              
              return buildAirports(state.airports);
            }
          },
        ),
      ),
    );



  
}
  void searchAirports( BuildContext context){
    // BlocProvider.of<AirportsBloc>(context).add(AirportsEvent.airportsFetching)
  }

  Widget buildAirports(List<Airport> airports) {
    return Expanded(
        child: ListView.builder(
          itemCount: airports.length ,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
      String iata = '${airports[index].iata}';
      return Container(
        child: Column(children: <Widget> [
          Text(airports[index].name)
        ]),
      );
    }));
  }
}
