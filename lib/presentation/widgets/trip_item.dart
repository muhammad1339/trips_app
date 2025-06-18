import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_app/core/ui/app_colors.dart';
import 'package:trips_app/core/ui/app_icons.dart';
import 'package:trips_app/core/ui/app_resources.dart';
import 'package:trips_app/core/utils/custom_date_utils.dart';
import 'package:trips_app/data/models/trip_model.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key, required this.item});

  final Trip item;

  @override
  Widget build(BuildContext context) {
    final diffNights = CustomDateUtils.getNightsBetweenDates(item.dates?.start ?? "", item.dates?.end ?? "");
    final diffNightsRange = CustomDateUtils.formatDateRange(item.dates?.start ?? "", item.dates?.end ?? "");
    return Container(
      // padding: EdgeInsets.all(16.0).r,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColors.color_171717,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadows: [BoxShadow(color: Color(0x19000000), blurRadius: 4, offset: Offset(0, 0), spreadRadius: 0)],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 343 / 188,
                child: CachedNetworkImage(
                  imageUrl: item.coverImage ?? "",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                      style: TextStyle(
                        fontFamily: AppResources.fontFamily,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.44,
                        letterSpacing: -0.54,
                      ),
                    ),
                    6.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.calendar, width: 24.r, height: 24.r, fit: BoxFit.cover),
                        SizedBox(width: 6.r),
                        Expanded(
                          child: Text(
                            "$diffNights nights $diffNightsRange",
                            style: TextStyle(
                              fontFamily: AppResources.fontFamily,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color_999999,
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFF262626),
                          ),
                        ),
                      ),
                    ),
                    12.verticalSpace,

                    12.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OverlappingAvatars(
                          imageUrls:
                              item.participants?.map((participant) => participant.avatarUrl ?? "").toList() ?? [],
                          radius: 16.r,
                          overlap: 15.r,
                        ),
                        Spacer(),
                        Text(
                          "${item.unfinishedTasks} unfinished tasks",
                          style: TextStyle(
                            fontFamily: AppResources.fontFamily,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.color_999999,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: 12.r,
            end: 16.r,
            child: Container(
              width: 32.r,
              height: 32.r,
              decoration: ShapeDecoration(
                color: Colors.black.withValues(alpha: 153),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              ),
              child: SvgPicture.asset(AppIcons.hDots, width: 20.r, height: 20.r, fit: BoxFit.scaleDown),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlappingAvatars extends StatelessWidget {
  final List<String> imageUrls;
  final double radius;
  final double overlap;

  const OverlappingAvatars({super.key, required this.imageUrls, this.radius = 20, this.overlap = 15});

  @override
  Widget build(BuildContext context) {
    final displayCount = imageUrls.length > 3 ? 3 : imageUrls.length;
    final extraCount = imageUrls.length > 3 ? imageUrls.length - 3 : 0;
    return SizedBox(
      height: radius * 2,
      width: (displayCount + (extraCount > 0 ? 1 : 0)) * (radius * 2 - overlap) + overlap,
      child: Stack(
        children: [
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * (radius * 2 - overlap),
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.white,
                child: CircleAvatar(radius: radius - 2, backgroundImage: NetworkImage(imageUrls[i])),
              ),
            ),
          if (extraCount > 0)
            Positioned(
              left: displayCount * (radius * 2 - overlap),
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black,
                child: Text(
                  '+$extraCount',
                  style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: radius - 6),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
