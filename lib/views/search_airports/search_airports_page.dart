import 'package:flutter/material.dart';

import 'package:aiports_of_the_city/views/list_airports/airports_bloc.dart';
import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';


class SearchAirportsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  // final SearchAirportsBloc bloc = BlocProvider.of<SearchAirportsBloc>(context);

    return Scaffold(
      body: Container(child: _createInput(),),
    );
  
}

    Widget _createInput() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: TextField(
          //autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Write an airport',
          ),
          // onChanged: (valor) {
          //   setState(() => airport = valor);
          // },
          // onSubmitted: (airport) {
          //   getAirports(airport);
          // }
          //placeholder
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
          leading: Text("${index + 1}"),
          title: Text("${airports[index].name}"),
          subtitle: Text('${airports[index].country}'),
          trailing: Text('${airports[index].iata}'),
          ),
      );
    });
  }
  
}
