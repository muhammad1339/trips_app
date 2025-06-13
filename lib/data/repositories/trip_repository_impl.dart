import 'package:trips_app/data/models/trip_model.dart';
import 'package:trips_app/domain/repositories/trip_repository.dart';

class TripRepositoryImpl extends TripRepository{
  @override
  Future<List<Trip>> getAllTrips() {
    throw UnimplementedError();
  }
}