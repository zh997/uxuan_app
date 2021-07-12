import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_fontsize.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_space.dart';

import 'logic.dart';
import 'state.dart';

class PersonalPage extends StatelessWidget {
  final PersonalLogic logic = Get.put(PersonalLogic());
  final PersonalState state = Get.find<PersonalLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: AppColors.color_2CAE72,
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.only(), children: [
            Container(
              height: ScreenUtil().setWidth(1000),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                      child: Image.asset(
                    AppImages.bg3,
                    fit: BoxFit.fill,
                  )),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10,
                        left: AppSpace.space_45,
                        right: AppSpace.space_45),
                    child: Column(
                      children: [_HeaderAvatar(), _CountGrid()],
                    ),
                  )
                ],
              ),
            ),
            _OrderEntry(),
            _HistoryGroupWork(),
            _ListItem(AppImages.m11, '我的资产'),
            _ListItem(AppImages.m07, '我的团队'),
            _ListItem(AppImages.m09, '邀请好友'),
            _ListItem(AppImages.m13, '我的关注'),
            _ListItem(AppImages.m06, '我的店铺'),
            _ListItem(AppImages.m01, '安全设置'),
            _ListItem(AppImages.m14, '关于我们'),
          ]))
        ],
      ),
    );
  }

  /** 顶部头像信息 */
  Widget _HeaderAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setWidth(150),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(150))),
              child: Image.asset(AppImages.logo),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'YYK314',
                      style: TextStyle(
                          fontSize: AppFontsize.size_45, color: Colors.white),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(20),
                    ),
                    Container(
                      height: ScreenUtil().setWidth(51),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: AppColors.color_FEEA7A,
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(51))),
                      child: Text(
                        '经理',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: AppColors.color_2D3035),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(20),
                ),
                Text('UID: 1000396',
                    style: TextStyle(
                        fontSize: AppFontsize.size_34, color: Colors.white))
              ],
            )
          ],
        ),
        Image.asset(
          AppImages.xiugai,
          width: ScreenUtil().setWidth(70),
          height: ScreenUtil().setWidth(83),
          color: Colors.white,
        )
      ],
    );
  }

  /** 统计 */
  Widget _CountGrid() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(180)),
      child: Wrap(
        children: [
          Opacity(
              opacity: 0.75,
              child: Container(
                width: ScreenUtil().setWidth(470),
                height: ScreenUtil().setWidth(260),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.color_2CAE72,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('资产',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('¥ 798.29',
                        style: TextStyle(
                            fontSize: AppFontsize.size_48,
                            color: AppColors.color_FFF000)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('今日收益',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    Text('¥ 0.00',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34, color: Colors.white))
                  ],
                ),
              )),
          Opacity(
              opacity: 0.75,
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(470),
                height: ScreenUtil().setWidth(260),
                decoration: BoxDecoration(
                    color: AppColors.color_2CAE72,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('资产',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('¥ 798.29',
                        style: TextStyle(
                            fontSize: AppFontsize.size_48,
                            color: AppColors.color_FFF000)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('今日收益',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    Text('¥ 0.00',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34, color: Colors.white))
                  ],
                ),
              )),
          Opacity(
              opacity: 0.75,
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(470),
                height: ScreenUtil().setWidth(260),
                decoration: BoxDecoration(
                    color: AppColors.color_2CAE72,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('资产',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('¥ 798.29',
                        style: TextStyle(
                            fontSize: AppFontsize.size_48,
                            color: AppColors.color_FFF000)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('今日收益',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    Text('¥ 0.00',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34, color: Colors.white))
                  ],
                ),
              )),
          Opacity(
              opacity: 0.75,
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(470),
                height: ScreenUtil().setWidth(260),
                decoration: BoxDecoration(
                    color: AppColors.color_2CAE72,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('资产',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('¥ 798.29',
                        style: TextStyle(
                            fontSize: AppFontsize.size_48,
                            color: AppColors.color_FFF000)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('今日收益',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34,
                            color: Colors.white)),
                    Text('¥ 0.00',
                        style: TextStyle(
                            fontSize: AppFontsize.size_34, color: Colors.white))
                  ],
                ),
              ))
        ],
        spacing: ScreenUtil().setWidth(45),
        runSpacing: ScreenUtil().setWidth(45),
      ),
    );
  }

  /** 订单入口 */
  Widget _OrderEntry() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(AppSpace.space_45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                AppImages.me05,
                width: ScreenUtil().setWidth(107),
                height: ScreenUtil().setWidth(107),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(32),
              ),
              Text(
                '待支付',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035),
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.me03,
                width: ScreenUtil().setWidth(107),
                height: ScreenUtil().setWidth(107),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(32),
              ),
              Text(
                '待收货',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035),
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.me06,
                width: ScreenUtil().setWidth(107),
                height: ScreenUtil().setWidth(107),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(32),
              ),
              Text(
                '已完成',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035),
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                AppImages.me04,
                width: ScreenUtil().setWidth(107),
                height: ScreenUtil().setWidth(107),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(32),
              ),
              Text(
                '全部',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035),
              )
            ],
          )
        ],
      ),
    );
  }

  /** 历史拼团 */
  Widget _HistoryGroupWork() {
    return Container(
      margin:
          EdgeInsets.only(top: AppSpace.space_34, bottom: AppSpace.space_34),
      color: Colors.white,
      padding: EdgeInsets.all(AppSpace.space_45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '历史拼团',
            style: TextStyle(
                fontSize: AppFontsize.size_34, color: AppColors.color_2D3035),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: ScreenUtil().setWidth(460),
                height: ScreenUtil().setWidth(188),
                padding: EdgeInsets.only(
                    left: AppSpace.space_25, right: AppSpace.space_25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.color_B578ED,
                          AppColors.color_EF5875
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.me02,
                      width: ScreenUtil().setWidth(84),
                      height: ScreenUtil().setWidth(84),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('待分享',
                            style: TextStyle(
                                fontSize: AppFontsize.size_34,
                                color: Colors.white)),
                        Text('0',
                            style: TextStyle(
                                fontSize: AppFontsize.size_60,
                                color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(460),
                height: ScreenUtil().setWidth(188),
                padding: EdgeInsets.only(
                    left: AppSpace.space_25, right: AppSpace.space_25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.color_5EE8AF,
                          AppColors.color_2297F7
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.me01,
                      width: ScreenUtil().setWidth(84),
                      height: ScreenUtil().setWidth(84),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('拼团中',
                            style: TextStyle(
                                fontSize: AppFontsize.size_34,
                                color: Colors.white)),
                        Text('0',
                            style: TextStyle(
                                fontSize: AppFontsize.size_60,
                                color: Colors.white))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /** 列表入口 */
  Widget _ListItem(String icon, String text) {
    return Container(
      padding: EdgeInsets.all(AppSpace.space_45),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 1, color: AppColors.color_eeeeee))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    width: ScreenUtil().setWidth(55),
                    height: ScreenUtil().setWidth(55),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: AppFontsize.size_38,
                        color: AppColors.color_2D3035),
                  )
                ],
              ),
              Image.asset(
                AppImages.xtgg,
                width: ScreenUtil().setWidth(55),
                height: ScreenUtil().setWidth(55),
              )
            ],
          )
        ],
      ),
    );
  }
}
