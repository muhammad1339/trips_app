import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_app/core/ui/app_colors.dart';
import 'package:trips_app/core/ui/app_icons.dart';
import 'package:trips_app/core/ui/app_resources.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            'Items',
            style: TextStyle(fontFamily: AppResources.fontFamily, fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Spacer(),
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(color: AppColors.color_171717, borderRadius: BorderRadius.circular(20.r)),
            child: SvgPicture.asset(AppIcons.sliders, width: 24.r, height: 24.r, fit: BoxFit.scaleDown),
          ),
        ],
      ),
    );
  }
}
