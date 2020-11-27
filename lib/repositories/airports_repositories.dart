import 'package:aiports_of_the_city/models/airport_model.dart';
import 'package:aiports_of_the_city/networking/api_client/api_client.dart';

class AirportsRepository {
  GetAirports _getAirports = GetAirports();
  Future<List<Airport>> fetchAllAirports() => _getAirports.fetchAllAirports();

  // Future<List<Airport>> fetchByIATA(String iata) =>
  //     _getAirports.fetchByIATA(iata);
}
