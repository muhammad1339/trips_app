import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trips_app/presentation/widgets/trip_item.dart';

class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10, // Example item count
      separatorBuilder: (ctx, index) => 12.verticalSpace,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemBuilder: (ctx, index) {
        return TripItem();
      },
    );
  }
}
