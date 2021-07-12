import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:uxuan_app/components/small_widget.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_fontsize.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_space.dart';

const APPBAR_SCROLL_OFFSET = 100; //设置滑动变化的偏移量

class GoodsDetailPge extends StatefulWidget {
  const GoodsDetailPge({Key? key}) : super(key: key);

  @override
  _GoodsDetailPgeState createState() => _GoodsDetailPgeState();
}

class _GoodsDetailPgeState extends State<GoodsDetailPge> {
  double appBarAlpha = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /** 滚动渐变 */

  double _scroll(double offest) {
    double alpha = offest / 100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    return alpha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: NotificationListener(
            onNotification: (Notification notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.depth == 0) {
                _scroll(notification.metrics.pixels);
              }

              return true;
            },
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.only(),
                  children: [
                    DetailSwiper(),
                    _GoodsInfo(),
                    _ServiceWidget(),
                    _GoodsHtml()
                  ],
                )),
                _BottomSheet(context)
              ],
            ),
          )),
          Positioned(
              child: Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: ScreenUtil().setWidth(250),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: AppSpace.space_45,
                right: AppSpace.space_45,
              ),
              color: AppColors.color_2CAE72,
            ),
          )),
          Positioned(
              child: Container(
            height: ScreenUtil().setWidth(250),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: AppSpace.space_45,
              right: AppSpace.space_45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Image.asset(
                    AppImages.xq001,
                    width: ScreenUtil().setWidth(87),
                    height: ScreenUtil().setWidth(87),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Opacity(
                    opacity: appBarAlpha,
                    child: Text(
                      '发哈发货加咖啡很舒服法考三闾大夫看哈额弗兰克回复发哈额发发哈',
                      style: TextStyle(
                          fontSize: AppFontsize.size_48, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )),
                Image.asset(
                  AppImages.xq002,
                  width: ScreenUtil().setWidth(87),
                  height: ScreenUtil().setWidth(87),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

/** 商品信息 */
Widget _GoodsInfo() {
  return Container(
    padding: EdgeInsets.all(AppSpace.space_45),
    color: Colors.white,
    child: Column(
      children: [
        Text(
          'Razer雷蛇 曼巴眼镜蛇竞技版竞技版RGB曼巴眼镜蛇竞技版竞技版RGB曼巴眼镜蛇竞技版竞技版RGB',
          style: TextStyle(fontSize: AppFontsize.size_48, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10,
        ),
        Price(
          key: GlobalKey(),
          price: '88.88',
          mainAxisAlignment: MainAxisAlignment.start,
          size: AppFontsize.size_60,
          color: AppColors.color_EC1929,
          unitSize: AppFontsize.size_36,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('¥138.00',
                style: TextStyle(
                  fontSize: AppFontsize.size_34,
                  color: AppColors.color_5E646A,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.color_5E646A,
                )),
            Text('已售：4件',
                style: TextStyle(
                    fontSize: AppFontsize.size_34,
                    color: AppColors.color_5E646A))
          ],
        )
      ],
    ),
  );
}

/** 商品服务 */
Widget _ServiceWidget() {
  return Container(
    padding: EdgeInsets.all(AppSpace.space_45),
    color: Colors.white,
    margin: EdgeInsets.only(top: AppSpace.space_34, bottom: AppSpace.space_34),
    child: Column(
      children: [
        Row(
          children: [
            Text('库存',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_5E646A)),
            SizedBox(
              width: 20,
            ),
            Text('15001',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035)),
          ],
        ),
        SizedBox(
          height: AppSpace.space_45,
        ),
        Row(
          children: [
            Text('服务',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_5E646A)),
            SizedBox(
              width: 20,
            ),
            Text('延保服务·正品保证·极速退款',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035)),
          ],
        ),
        SizedBox(
          height: AppSpace.space_45,
        ),
        Row(
          children: [
            Text('运费',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_5E646A)),
            SizedBox(
              width: 20,
            ),
            Text('¥0.00',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035)),
          ],
        )
      ],
    ),
  );
}

/** 商品详情 */
Widget _GoodsHtml() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpace.space_45),
          child: Row(
            children: [
              Expanded(
                  child: Opacity(
                opacity: 0.29,
                child: Container(
                  height: 1,
                  color: AppColors.color_8E8E8E,
                ),
              )),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setWidth(57),
                width: ScreenUtil().setWidth(345),
                child: Text(
                  '商品详情',
                  style: TextStyle(
                      fontSize: AppFontsize.size_36,
                      color: AppColors.color_2D3035,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Opacity(
                opacity: 0.29,
                child: Container(
                  height: 1,
                  color: AppColors.color_8E8E8E,
                ),
              )),
            ],
          ),
        ),
        Column(
          children: [
            Image.asset(AppImages.ping3),
            Image.asset(AppImages.ping4),
          ],
        )
      ],
    ),
  );
}

/** 底部操作 */
Widget _BottomSheet(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.xq2,
                  width: ScreenUtil().setWidth(47),
                  height: ScreenUtil().setHeight(47),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text('收藏',
                      style: TextStyle(
                          fontSize: AppFontsize.size_30,
                          color: AppColors.color_2D3035)),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  AppImages.xq1,
                  width: ScreenUtil().setWidth(47),
                  height: ScreenUtil().setHeight(47),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text('客服',
                      style: TextStyle(
                          fontSize: AppFontsize.size_30,
                          color: AppColors.color_2D3035)),
                ),
              ],
            )
          ],
        )),
        Container(
          height: ScreenUtil().setWidth(144),
          alignment: Alignment.center,
          color: AppColors.color_FFBD26,
          width: ScreenUtil().setWidth(378),
          child: Text(
            '加入购物车',
            style:
                TextStyle(fontSize: AppFontsize.size_40, color: Colors.white),
          ),
        ),
        Container(
          height: ScreenUtil().setWidth(144),
          alignment: Alignment.center,
          color: AppColors.color_2CAE72,
          width: ScreenUtil().setWidth(378),
          child: Text(
            '立即购买',
            style:
                TextStyle(fontSize: AppFontsize.size_40, color: Colors.white),
          ),
        )
      ],
    ),
  );
}

class SwiperItem {
  final String url;
  SwiperItem(this.url);
}

class DetailSwiper extends StatelessWidget {
  final List<SwiperItem> list = [
    SwiperItem(AppImages.banner1),
    SwiperItem(AppImages.banner2),
    SwiperItem(AppImages.banner3),
    SwiperItem(AppImages.banner4)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(1080),
      child: Swiper(
          key: UniqueKey(),
          index: 0,
          duration: 1000,
          itemCount: list.length,
          autoplay: true,
          pagination: SwiperPagination(builder: SwiperCustomPagination(builder:
              (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(800), 0, 0, 20),
                    alignment: Alignment.center,
                    height: ScreenUtil().setWidth(76),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(76))),
                    width: ScreenUtil().setWidth(128),
                  ),
                )),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(ScreenUtil().setWidth(800), 0, 0, 20),
                  child: Text(
                      '${swiperPluginConfig.activeIndex + 1} | ${list.length}',
                      style: TextStyle(
                          color: Colors.white, fontSize: AppFontsize.size_36)),
                )
              ],
            );
          })),
          itemBuilder: (BuildContext context, int index) =>
              Image.asset(list[index].url, fit: BoxFit.cover)),
    );
  }
}
