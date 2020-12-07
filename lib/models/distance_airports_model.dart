class DistanceOne {
  Distance distance;

  DistanceOne();

  DistanceOne.fromJson(Map json){
    final items = new Distance.fromJsonMap(json);
    distance = items;

    
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

  Distance.fromJsonMap(Map<String, dynamic> json){
    code = json['code'];
    distance = json['distance'];
    originIata = json['originIata'];
    destinationIata = json['destinationIata'];
  }
}