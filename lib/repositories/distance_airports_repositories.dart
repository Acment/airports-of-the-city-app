import 'package:aiports_of_the_city/networking/api_client/api_client.dart';



class DistanceAirportsRepository{

  GetAirports _getAirports = GetAirports();

  Future<Map<String, dynamic>> fetchDistance(List<String> routeText ) => _getAirports.fetchDistanceAirports(routeText);
  
}