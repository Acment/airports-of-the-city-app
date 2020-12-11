import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/networking/api_client/api_client.dart';

class AirportsSearchRepository {
  
  GetAirports _getAirports = GetAirports();
  Future<List<Airport>> fetchByFilter(String inputText) => _getAirports.fetchByFilter(inputText);

  Future<List<Airport>> fetchByIATA(String iata) =>
      _getAirports.fetchByIATA(iata);
  
  Future<List<Airport>> fetchByICAO(String icao) =>
      _getAirports.fetchByICAO(icao);
  
}
