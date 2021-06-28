import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_radius.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Container(
            color: AppColors.color_31A76B,
            height: ScreenUtil().setWidth(542),
          )),
          SafeArea(child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _SearchTextField(),
                        ),
                        Image.asset(
                            AppImages.app_icon_msg,
                            width: ScreenUtil().setWidth(71),
                            height: ScreenUtil().setWidth(71),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: CustomScrollView(
                slivers: [
                  SliverList(delegate: SliverChildListDelegate([
                    Container(
                      child: Text('内容'),
                    )
                  ]))
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }

  Widget _SearchTextField(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.radius_20),
        color: Colors.white
      ),
      child: TextField(
         cursorHeight: 2,
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          labelText: '商品名称/规格/型号/首字母',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: InputBorder.none
        ),
      ),
    );
  }
}
