import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_app/core/ui/app_colors.dart';
import 'package:trips_app/core/ui/app_icons.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0).r,

      child: Row(
        children: [
          SvgPicture.asset(AppIcons.menu),
          16.horizontalSpace,
          SvgPicture.asset(AppIcons.logoIpsum),
          Spacer(),
          SvgPicture.asset(AppIcons.settings),
          12.horizontalSpace,
          SvgPicture.asset(AppIcons.bell),
          12.horizontalSpace,
          Container(height: 22.h, width: 1.r, color: AppColors.color_484848),
          12.horizontalSpace,
          Container(
            clipBehavior: Clip.antiAlias,
            width: 32.r,
            height: 32.r,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
            child: CachedNetworkImage(imageUrl: "https://randomuser.me/api/portraits/men/96.jpg"),
          ),
        ],
      ),
    );
  }
}
