import 'package:aiports_of_the_city/networking/api_client/api_client.dart';



class DistanceAirportsRepository{

  GetAirports _getAirports = GetAirports();

  Future<Map<String, dynamic>> fetchDistance({String inputOrigin, String codeOrigin, String inputDestination, String codeDestination }) {
    return _getAirports.fetchDistanceAirports(
      inputOrigin: inputOrigin, 
      codeOrigin: codeOrigin ,
      inputDestination: inputDestination, 
      codeDestination: codeDestination
      );
  }
  
}