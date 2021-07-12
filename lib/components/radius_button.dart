import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uxuan_app/constant/app_colors.dart';

class RadiusButton extends StatelessWidget {
  final String buttonText;
  final bool disabled;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final bool isLine;
  final Function onTap;
  RadiusButton(this.buttonText,
      {this.width = 895,
      this.height = 150,
      this.radius = 150,
      required this.color,
      this.isLine = false,
      required this.onTap,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        if (disabled) onTap();
      },
      child: Opacity(
        opacity: disabled ? 0.3 : 1.0,
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(this.width),
          height: ScreenUtil().setWidth(this.height),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: color),
              color: isLine ? Colors.transparent : color,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    color: AppColors.color_14A239,
                    blurRadius: 10.0,
                    spreadRadius: 0)
              ]),
          child: Text(buttonText,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(51),
                  color: isLine ? AppColors.color_2CAE72 : Colors.white)),
        ),
      ),
    );
  }
}
