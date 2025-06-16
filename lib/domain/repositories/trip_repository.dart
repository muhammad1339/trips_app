import 'package:trips_app/data/models/trip_model.dart';

abstract class TripRepository {
  Future<List<Trip>?> getAllTrips();
}
