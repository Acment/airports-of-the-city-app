import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';


class SearchAirportsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final SearchAirportsBloc bloc = BlocProvider.of<SearchAirportsBloc>(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            TextField(
                //autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Write an airport',
                ),
                onChanged: (String inputText){
                  if (inputText.length == 3){
                    bloc.add(SearchByIataEvent(inputText: inputText.trimLeft().trimRight().toUpperCase()));
                  }
                },
                ),
            choiceChips(context),
              
              Expanded(child: BlocBuilder<SearchAirportsBloc, SearchAirportsState>(builder: (context, state){
                print('state: $state');
                if (state is SearchAirportsInitial ){
                  return Center(child: Text('Write somenthing up there'),);
                
                } else if(state is SearchAirportsInFetch ){
                  return Center(
                    child: CircularProgressIndicator(
                    ),
                  );
                } else if(state is SearchAirportsFetchSuccess) {
                  return buildAirports(state.airports);
                
                }else if(state is SearchAirportsError) {
                  return Center(child: Text('Error Ocurred'),);
                }else if(state is SearchAirportsEmpty ){
                  return Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text('No results found', style: TextStyle(fontSize: 22.0),),
                      // Text('Try to write the first letter capitalized!', style: TextStyle(fontSize: 17.5))
                    ],),);
                }
                else{
                  return  Center(child: Text('Unexpected Error Ocurred'),);
                }
              }),)

          ],
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
          leading: Text("${airports[index].iata}", style: TextStyle(height: 2.3),),
          title: Text("${airports[index].name}"),
          subtitle: Text('${airports[index].country}'),
          ),
      );
    });
  }

  Widget choiceChips(context) {
    
    return Row(
      children: <Widget>[
        ChoiceChip(label: Text('General', style: TextStyle(fontSize: 20.0),), selected: true, backgroundColor: Colors.blue[900], labelStyle: TextStyle(color: Colors.black), ),
        ChoiceChip(label: Text('ICAO', style: TextStyle(fontSize: 20.0)), selected: false,),
        ChoiceChip(label: Text('IATA', style: TextStyle(fontSize: 20.0)), selected: false,),
      ],
    );
  }  
}