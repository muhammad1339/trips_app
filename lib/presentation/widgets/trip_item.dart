import 'package:flutter/material.dart';
import 'package:trips_app/core/ui/app_colors.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: AppColors.color_171717,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadows: [BoxShadow(color: Color(0x19000000), blurRadius: 4, offset: Offset(0, 0), spreadRadius: 0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Trip Title'), const SizedBox(height: 8.0), Text('Trip description goes here. It can be a brief overview of the trip.')],
      ),
    );
  }
}
