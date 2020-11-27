import 'package:aiports_of_the_city/views/list_airports/airports_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/repositories/airports_repositories.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';

class AirportsPage extends StatefulWidget {
  final AirportsRepository airportsRepository;
  AirportsPage({this.airportsRepository});

  @override
  _AirportsPageState createState() => _AirportsPageState();
}

class _AirportsPageState extends State<AirportsPage> {
  
  
  @override
  Widget build(BuildContext context) {
  final AirportsBloc bloc = BlocProvider.of<AirportsBloc>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<AirportsBloc, AirportsState>(
          builder: (context, state) {
            if (state is AirportsFetching){
              // bloc.add(AirportsEvent.loadSuccess);
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }else if(state is AirportsFetchSuccess){
              return buildAirports(state.airports); 
            } else{
              bloc.add(AirportsEvent.loadSuccess);
            }
          },
        ),
      ),
    );



  
}

  Widget buildAirports(List<Airport> airports) {
    return Expanded(
        child: ListView.builder(
          itemCount: airports.length ,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
      
      return Container(
        child: Column(children: <Widget> [
          Text(airports[index].name),
          Text(airports[index].iata),
        ]),
      );
    }));
  }
}
