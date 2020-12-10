class Airports {
  List<Airport> items = new List();

  Airports();

  Airports.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final airport = new Airport.fromJsonMap(item);
      items.add(airport);
    }
  }
}

class AirportOne {
  List<Airport> items = new List();

  AirportOne();

  AirportOne.fromJson(Map item) {
    final airport = new Airport.fromJsonMap(item);
    items.add(airport);
  }
}

class AirportDistance{
  Airport airport;

  AirportDistance.fromJson(Map item){
    final items = new Airport.fromJsonMap(item);
    airport = items;
  }
}

class Airport {
  String iata;
  String name;
  String city;
  String country;
  String icao;
  String latitude;
  String longitude;
  String altitude;
  int timezone;
  String dst;
  String type;
  String source;

  Airport({
    this.iata,
    this.name,
    this.city,
    this.country,
    this.icao,
    this.latitude,
    this.longitude,
    this.altitude,
    this.timezone,
    this.dst,
    this.type,
    this.source,
  });

  Airport.fromJsonMap(Map<String, dynamic> json) {
    iata = json['IATA'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    icao = json['ICAO'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    altitude = json['altitude'];
    timezone = json['timezone'];
    dst = json['dst'];
    type = json['type'];
    source = json['source'];
  }
}