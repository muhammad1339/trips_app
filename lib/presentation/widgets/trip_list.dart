import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trips_app/core/di/providers.dart';
import 'package:trips_app/presentation/viewmodels/trip_viewmodel.dart';
import 'package:trips_app/presentation/widgets/trip_item.dart';

class TripList extends ConsumerStatefulWidget {
  const TripList({super.key});

  @override
  ConsumerState<TripList> createState() => _TripListState();
}

class _TripListState extends ConsumerState<TripList> {
  @override
  void initState() {
    super.initState();
    // Use postFrameCallback to ensure the widget is built before calling the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tripViewModelProvider.notifier).fetchTrips();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tripState = ref.watch(tripViewModelProvider);

    if (tripState is TripLoadingState) {
      return Center(child: CircularProgressIndicator());
    } else if (tripState is TripErrorState) {
      return Center(child: Text('Error: ${tripState.message}'));
    } else if (tripState is TripLoadedState) {
      return _buildTripList(tripState);
    } else {
      return Center(child: Text('No trips available'));
    }
  }

  Widget _buildTripList(TripLoadedState tripState) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: tripState.trips.length,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final trip = tripState.trips[index];
        debugPrint('Trip: ${trip.toJson()}'); // Debugging line
        return TripItem(item: trip);
      },
    );
  }
}
