import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/models/distance_airports_model.dart';
import 'package:aiports_of_the_city/views/distance_airports/distance_airports_bloc.dart';

class DistanceAirportsPage extends StatefulWidget {

  @override
  _DistanceAirportsPageState createState() => _DistanceAirportsPageState();
}

class _DistanceAirportsPageState extends State<DistanceAirportsPage> {
  String origin;

  String codeOrigin;

  String destination;

  String codeDestination;


  List<String> _codes = ['IATA', 'ICAO'];

  @override
  Widget build(BuildContext context) {
  final DistanceAirportsBloc _bloc = BlocProvider.of<DistanceAirportsBloc>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 37.0),
        child: Column(
          children: <Widget>[
            originRow(),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            destinationRow(),

            ElevatedButton(
              onPressed: () => _bloc.add(DistanceSearchEvent(origin: origin, codeOrigin: codeOrigin, destination: destination, codeDestination: codeDestination)), 
            child: Text('Search'),
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

    List<DropdownMenuItem<String>> getCodeDropdown() {
    List<DropdownMenuItem<String>> codeList = new List();

    _codes.forEach((code) {
      codeList.add(DropdownMenuItem(
        child: Text(code),
        value: code.toLowerCase(),
      ));
    });
    return codeList;
  }

  Widget originRow(){
      return Row(children: <Widget>[
        SizedBox(width: 30.0),
        DropdownButton(
            
            value: codeOrigin==null? codeOrigin:codeOrigin.toLowerCase(),
            items: getCodeDropdown(),
            onChanged: (opt) {
              setState(() {
                codeOrigin = opt;
              });
            },
          ),
        Padding(padding: EdgeInsets.only(right: 20.0)),
          Flexible(
                      child: TextField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 21.0),
              labelText: 'Origin',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Write origin code',
            ),
            onChanged: (String inputText){
              if (inputText.length > 0){
                origin = inputText.trim().toUpperCase();
              }
            },
            ),
          ),
      ],);
    }

  Widget destinationRow(){
      return Row(children: <Widget>[
        SizedBox(width: 30.0),
        DropdownButton(
            
            value: codeDestination==null? codeDestination:codeDestination.toLowerCase(),
            items: getCodeDropdown(),
            onChanged: (opt) {
              setState(() {
                codeDestination = opt;
              });
            },
          ),
        Padding(padding: EdgeInsets.only(right: 20.0)),
          Flexible(
                      child: TextField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 21.0),
              labelText: 'Destination',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Write destination code',
            ),
            onChanged: (String inputText){
              if (inputText.length > 0){
                destination = inputText.trim().toUpperCase();
              }
            },
            ),
          ),
      ],);
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