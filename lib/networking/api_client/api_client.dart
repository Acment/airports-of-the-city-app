import 'package:dio/dio.dart';

import 'package:aiports_of_the_city/models/airport_model.dart';

class GetAirports {
  String _url = 'airports-of-the-world.herokuapp.com';
  int _limit = 10;
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
    Uri uri = Uri.https(_url, 'airports/iata/$iata');

    final response = await Dio().getUri(uri);

    final airports = new Airports.fromJsonList(response.data['data']);

    return airports.items;
  }
}
