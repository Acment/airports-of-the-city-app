import 'package:dio/dio.dart';

import 'package:aiports_of_the_city/models/distance_airports_model.dart';
import 'package:aiports_of_the_city/models/airport_model.dart';

class GetAirports {
  String _url = 'airports-of-the-world.herokuapp.com';
  int _limit = 100;

  List<Airport> empty = [];
  Map<String, dynamic> emptyMap = {};

  // String limit

  Future<List<Airport>> fetchAllAirports() async {
    Uri uri = Uri.https(_url, 'airports', {
      'limit': _limit.toString(),
    });

    final response = await Dio().getUri(uri);

    final airports = new Airports.fromJsonList(response.data['data']['data']);

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
    try{
              Uri uri = Uri.https(_url, 'airports/iata/$icao');
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

  Future<Map<String, dynamic>> fetchDistanceAirports({
    String inputOrigin, 
    String codeOrigin , 
    String inputDestination,
    String codeDestination,
    }) async{
    try{
      Uri uriDistance = Uri.https(_url, 'routes/from/$codeOrigin/$inputOrigin/to/$codeDestination/$inputDestination');
      Uri uriOrigin = Uri.https(_url, 'airports/$codeOrigin/$inputOrigin');
      Uri uriDestination = Uri.https(_url, 'airports/$codeDestination/$inputDestination');

      final responseDistance = await Dio().getUri(uriDistance);
      final responseOrigin = await Dio().getUri(uriOrigin);
      final responseDestination = await Dio().getUri(uriDestination);

      final distance = DistanceOne.fromJson(responseDistance.data['data']);
      final origin = AirportDistance.fromJson(responseOrigin.data['data']);
      final destination = AirportDistance.fromJson(responseDestination.data['data']);

      final Map<String, dynamic> distanceAirports = {
        'distance'   : distance.distance,
        'origin'     : origin.airport,
        'destination': destination.airport
      };
      
      return distanceAirports;
    }on DioError catch(e){
      if(e.response.statusCode == 400){
        return emptyMap;
      }else{
        return emptyMap;
      }
    }
  }
}
