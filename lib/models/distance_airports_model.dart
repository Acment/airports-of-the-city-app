class DistanceOne {
  List<Distance> distance = new List();

  DistanceOne();

  DistanceOne.fromJson(Map json){
    final items = new Distance.fromJsonMap(json);
    distance.add(items);
  }
}

class Distance{
  String code;
  String distance;
  String originIata;
  String destinationIata;

  Distance({
    this.code,
    this.distance,
    this.originIata,
    this.destinationIata,
  });

  Distance.fromJsonMap(Map<String, String> json){
    code = json['code'];
    distance = json['distance'];
    originIata = json['originIata'];
    destinationIata = json['destinationIata'];
  }
}