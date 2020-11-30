import 'package:aiports_of_the_city/views/list_airports/airports_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';


class AirportsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  final AirportsBloc bloc = BlocProvider.of<AirportsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed: () {})],
        title: Text('Airports List'),
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<AirportsBloc, AirportsState>(
          builder: (context, state) {
            if (state is AirportsFetchInProgress){
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }else if(state is AirportsFetchSuccess){
                // bloc.add(AirportsEvent);
              return buildAirports(state.airports); 
            }else if (state is AirportsFetchError){
              return Center(child: Text('Error has ocurred'));
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  
}

  Widget buildAirports(List<Airport> airports) {
    return ListView.builder(
      itemCount: airports.length ,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
      
      return Card(
                child: ListTile(
          leading: Text("${airports[index].iata}"),
          title: Text("${airports[index].name}"),
          subtitle: Text('${airports[index].country}'),
          // trailing: Text('${airports[index].iata}'),
          ),
      );
    });
  }
}
