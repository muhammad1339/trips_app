import 'package:riverpod/riverpod.dart';
import 'package:trips_app/data/models/trip_model.dart';
import 'package:trips_app/domain/repositories/trip_repository.dart';

abstract class TripState {}

class TripInitialState extends TripState {}

class TripLoadingState extends TripState {}

class TripLoadedState extends TripState {
  final List<Trip> trips;

  TripLoadedState(this.trips);
}

class TripErrorState extends TripState {
  final String message;

  TripErrorState(this.message);
}

class TripViewModel extends StateNotifier<TripState> {
  TripViewModel(this.tripRepository) : super(TripInitialState());

  final TripRepository tripRepository;

  Future<void> fetchTrips() async {
    state = TripLoadingState();
    try {
      final trips = await tripRepository.getAllTrips();
      if (trips != null && trips.isNotEmpty) {
        state = TripLoadedState(trips);
      } else {
        state = TripErrorState('No trips found');
      }
    } catch (e) {
      state = TripErrorState(e.toString());
    }
  }
}
