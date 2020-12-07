import 'package:aiports_of_the_city/networking/api_client/api_client.dart';



class DistanceAirportsRepository{

  GetAirports _getAirports = GetAirports();

  Future<Map<String, dynamic>> fetchDistance({String inputOrigin, String inputDestination}) => _getAirports.fetchDistanceAirports(inputOrigin: inputOrigin, inputDestination: inputDestination );
  
}