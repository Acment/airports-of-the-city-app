import 'package:dio/dio.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';

class GetAirports {
  String _url = 'airports-of-the-world.herokuapp.com';
  int _limit = 100;

  List<Airport> empty = [];

  // String limit

  Future<List<Airport>> fetchAllAirports() async {
    Uri uri = Uri.https(_url, 'airports', {
      'limit': _limit.toString(),
    });

    final response = await Dio().getUri(uri);

    final airports = new Airports.fromJsonList(response.data['data']['data']);

    print(airports.items);
    return airports.items;
  }

  Future<List<Airport>> fetchByIATA(String iata) async {
    try{
          Uri uri = Uri.https(_url, 'airports/iata/$iata');
    final response = await Dio().getUri(uri);

    final airports = new AirportOne.fromJson(response.data['data']);
    print(airports.items);
    return airports.items;
    }on DioError catch (e) {
      if(e.response.statusCode == 404){
        return empty;
      }else{
        print(e.message);
        return empty;
      }
    }
  }

  Future<List<Airport>> fetchByICAO(String icao) async {
    Uri uri = Uri.https(_url, 'airports/iata/PTY');

    final response = await Dio().getUri(uri);
    print('response: ${response.data['data']}');

    final airports = new AirportOne.fromJson(response.data['data']);
    print('airports: $airports');
  
    print('iata: ${airports.items}');
    return airports.items;
  }

  Future<List<Airport>> fetchByFilter(String inputText) async {
    Uri uri = Uri.https(_url, 'airports',{
      'name' : inputText,
      'city' : inputText,
      'country': inputText,
      'fullMatch': '0',
      'limit' : _limit.toString(),
    });

    final response = await Dio().getUri(uri);

    final airports = new Airports.fromJsonList(response.data['data']['data']);
  
    print('apiclient: ${airports.items}');
    return airports.items; 
  }
}
