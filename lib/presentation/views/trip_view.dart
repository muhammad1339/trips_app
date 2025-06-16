import 'package:flutter/material.dart';
import 'package:trips_app/presentation/widgets/trip_list.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TripList());
  }
}
