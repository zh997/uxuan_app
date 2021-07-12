import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_fontsize.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_radius.dart';

class GoodsItem extends StatelessWidget {
  late GestureTapCallback onTap;
  GoodsItem({required Key key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.radius_30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.color_E7E8E8,
                  blurRadius: 20.0,
                  spreadRadius: 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ScreenUtil().setWidth(421),
              height: ScreenUtil().setWidth(421),
              child: Image.asset(
                AppImages.c04,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '但仙山的宝宝爆爆500ML 赠送5倍资产',
                  style: TextStyle(
                    fontSize: AppFontsize.size_40,
                    color: AppColors.color_2D3035,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '已出售：345件',
                  style: TextStyle(
                      fontSize: AppFontsize.size_30,
                      color: AppColors.color_878888),
                ),
                Text(
                  '¥ 599',
                  style: TextStyle(
                      fontSize: AppFontsize.size_48,
                      color: AppColors.color_EC1929),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
