import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/views/distance_airports/distance_airports_bloc.dart';

class DistanceAirportsPage extends StatelessWidget {

  String origin;
  String destination;

  @override
  Widget build(BuildContext context) {
  final DistanceAirportsBloc _bloc = BlocProvider.of<DistanceAirportsBloc>(context);
    
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 37.0),
        child: Column(
          children: <Widget>[
            inputsFields(),
            ElevatedButton(
              onPressed: () => _bloc.add(DistanceSearchEvent(origin: origin, destination: destination)), 
              child: Text('submmit'),
              ),
          ]
        ),
      ) 
    );
  }

  Widget inputsFields(){
    return Column(
      children: [
        TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 21.0),
          labelText: 'Origin',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Write IATA origin code',
        ),
        onChanged: (String inputText){
          if (inputText.length > 0){
            destination = inputText.trim().toUpperCase();
          }
        },
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 21.0),
          labelText: 'Destination',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Write IATA destination code',
        ),
        onChanged: (String inputText){
          if (inputText.length > 0){
            origin = inputText.trim().toUpperCase();
          }
        },
        ),
      ],
    );
  }
  
}