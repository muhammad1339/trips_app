import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trips_app/core/ui/app_colors.dart';
import 'package:trips_app/presentation/widgets/app_header.dart';
import 'package:trips_app/presentation/widgets/list_header.dart';
import 'package:trips_app/presentation/widgets/trip_list.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
      
        body: Column(
          children: [
            AppHeader(),
            Container(height: 1.h, color: AppColors.color_484848),
            16.verticalSpace,
            ListHeader(),
            Expanded(child: TripList()),
          ],
        ),
      ),
    );
  }
}
