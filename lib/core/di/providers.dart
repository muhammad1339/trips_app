import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trips_app/data/repositories/trip_repository_impl.dart';
import 'package:trips_app/domain/repositories/trip_repository.dart';
import 'package:trips_app/presentation/viewmodels/trip_viewmodel.dart';

// repository provider
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepositoryImpl();
});

// viewmodel provider
final tripViewModelProvider = StateNotifierProvider<TripViewModel, TripState>((ref) {
  final tripRepository = ref.watch(tripRepositoryProvider);
  return TripViewModel(tripRepository);
});
