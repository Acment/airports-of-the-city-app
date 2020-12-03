import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aiports_of_the_city/views/search_airports/search_airports_bloc.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';


class SearchAirportsPage extends StatelessWidget {

  String _inputText;
  
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
                  if (inputText.length > 0){
                    _inputText = inputText;
                    bloc.add(SearchByFilterEvent(inputText: _inputText));
                  }
                },
                ),

              
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
                  return Center(child: Text('No results found'),);
                }
                else{
                  return  Center(child: Text('ELSE'),);
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
          leading: Text("${airports[index].iata}"),
          title: Text("${airports[index].name}"),
          subtitle: Text('${airports[index].country}'),
          ),
      );
    });
  }
  
}
