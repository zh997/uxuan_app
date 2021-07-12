import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uxuan_app/components/radius_button.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_fontsize.dart';
import 'package:uxuan_app/constant/app_images.dart';

class Empty extends StatelessWidget {
  final String text;
  final String btnText;
  final Function onTap;

  const Empty(
      {required Key key,
      required this.text,
      required this.onTap,
      required this.btnText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.gwc,
            width: ScreenUtil().setWidth(587),
            height: ScreenUtil().setWidth(301),
          ),
          SizedBox(height: 20),
          Text(text,
              style: TextStyle(
                  color: AppColors.color_A1A7B3,
                  fontSize: AppFontsize.size_48)),
          SizedBox(height: 20),
          RadiusButton(
            btnText,
            width: 400,
            height: 130,
            onTap: onTap,
            color: AppColors.color_2CAE72,
          )
        ],
      ),
    ));
  }
}
