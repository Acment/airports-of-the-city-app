part of 'distance_airports_bloc.dart';

abstract class DistanceAirportsState extends Equatable {
  const DistanceAirportsState();
  
  @override
  List<Object> get props => [];
}

class DistanceAirportsInitial extends DistanceAirportsState {}

class DistanceFetchInProgress extends DistanceAirportsState {}

class DistanceFetchSuccess extends DistanceAirportsState {
  final Map<String, dynamic> distanceAirports;
  
  DistanceFetchSuccess({@required this.distanceAirports});
}

class DistanceFetchEmpty extends DistanceAirportsState {}

class AirportsFetchError extends DistanceAirportsState {}