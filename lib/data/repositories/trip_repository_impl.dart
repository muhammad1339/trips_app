import 'package:flutter/services.dart';
import 'package:trips_app/data/models/trip_model.dart';
import 'package:trips_app/domain/repositories/trip_repository.dart';

class TripRepositoryImpl extends TripRepository {
  /// Retrieves all trips from the local JSON asset file.
  ///
  /// Reads the `assets/data/trips_mock.json` file, parses its content into a [TripModel],
  /// and returns a list of [Trip] objects if available. Returns `null` if no trips are found.
  @override
  Future<List<Trip>?> getAllTrips() async {
    // read the trips from json file from assets/data/trips_mock.json
    final String jsonString = await rootBundle.loadString('assets/data/trips_mock.json');
    final TripModel tripModel = TripModel.fromJson(jsonString);
    // return a list of Trip objects
    if (tripModel.trips != null) {
      return tripModel.trips;
    }
    return null;
  }
}
