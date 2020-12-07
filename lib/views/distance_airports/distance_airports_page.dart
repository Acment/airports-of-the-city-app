import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/models/distance_airports_model.dart';
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
              Expanded(child: BlocBuilder<DistanceAirportsBloc, DistanceAirportsState>(builder: (context, state){
                print('state: $state');
                if(state is DistanceAirportsInitial){
                  return Center(child: Text('Write airports codes up there'),);
                }else if(state is DistanceFetchInProgress){
                  return Center(
                    child: CircularProgressIndicator()
                    ,);
                }else if(state is DistanceFetchSuccess){
                  return displayDistance(state.distanceAirports);
                }else if(state is DistanceFetchError){
                  return Center(child: Text('Error Ocurred'),);
                }else if(state is DistanceFetchEmpty){
                  return Center(child: Text('No results found', style: TextStyle(fontSize: 22.0),),);
                }else{
                  return Center(child: Text('Unexpected Error Ocurred'),);
                }
              },))
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
          origin = inputText.trim().toUpperCase();
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
            destination = inputText.trim().toUpperCase();
          }
        },
        ),
      ],
    );

  }
  Widget displayDistance(Map<String, dynamic> airportsDistance){
    Distance distance = airportsDistance['distance'];
    Airport origin = airportsDistance['origin'];
    Airport destination = airportsDistance['destination'];
    
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(title: (Text('${distance.code}') ),
          leading: Text('Code', style: TextStyle(height: 2.6),),
          subtitle: Text('Distance: ${distance.distance}'),
          ),
        ),
        Card(
          child: ListTile(
          leading: Text("Origin", style: TextStyle(height: 2.3),),
          title: Text("${origin.name}"),
          subtitle: Text('${origin.country}'),
          ),
      ),
        Card(
          child: ListTile(
          leading: Text("Destination", style: TextStyle(height: 2.3),),
          title: Text("${destination.name}"),
          subtitle: Text('${destination.country}'),
          ),
      ),

      ],
    );
  }
  
}