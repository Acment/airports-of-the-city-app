import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/views/detail_airports/detail_airports_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAirportsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<DetailAirportsBloc, DetailAirportsState>(
          builder: (context, state){
            if(state is DetailAirportsFetchInProgress){
              return Center(
                child: CircularProgressIndicator(),);
            }else if(state is DetailAirportsFetchSuccess){
              return displayDetails(state.airportDetail);
            }else if(state is DetailAirportsFetchError){
              return Center(child: Text('Error has ocurred'),);
            }else{
              return Container();
            }
          },
          ) ,
        ),
    );
  }

  Widget displayDetails(List<Airport> detailAirport){
    return ListView(
      children: [
        Card(child: ListTile( title: Text('Name: ${detailAirport[0].name}'),),),
        Card(child: ListTile( title: Text('City: ${detailAirport[0].city}'),),),
        Card(child: ListTile( title: Text('Country: ${detailAirport[0].country}'),),),
        Card(child: ListTile( title: Text('IATA: ${detailAirport[0].iata}'),),),
        Card(child: ListTile( title: Text('ICAO: ${detailAirport[0].icao}'),),),
        Card(child: ListTile( title: Text('Latitude: ${detailAirport[0].latitude}'),),),
        Card(child: ListTile( title: Text('Longitude: ${detailAirport[0].longitude}'),),),
        Card(child: ListTile( title: Text('Altitude: ${detailAirport[0].altitude}'),),),
        Card(child: ListTile( title: Text('Timezone: ${detailAirport[0].timezone}'),),),
        Card(child: ListTile( title: Text('dst: ${detailAirport[0].dst}'),),),
        Card(child: ListTile( title: Text('Type: ${detailAirport[0].type}'),),),
        Card(child: ListTile( title: Text('Source: ${detailAirport[0].source}'),),),
      ],
    );
  }
}