import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uxuan_app/common/routes.dart';
import 'package:uxuan_app/components/cache_image.dart';
import 'package:uxuan_app/components/goods_item.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_fontsize.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_radius.dart';
import 'package:uxuan_app/constant/app_space.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  late TabController _tabController;

  List<Widget> tabs = [
    Text('精选'),
    Text('限时爆款'),
    Text('食品饮料'),
    Text('数码电器'),
    Text('家纺'),
    Text('生鲜'),
    Text('百货'),
    Text('女装'),
    Text('男装'),
    Text('美食'),
    Text('书画'),
    Text('饰品'),
    Text('私人定制'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final List<SwiperItem> bannerList = state.bannerList.value;
        print(bannerList);
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: AppColors.color_31A76B,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(
                        AppSpace.space_45, AppSpace.space_20, AppSpace.space_45, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _SearchTextField(),
                            ),
                            SizedBox(
                              width: AppSpace.space_79,
                            ),
                            Image.asset(
                              AppImages.app_icon_msg,
                              width: ScreenUtil().setWidth(71),
                              height: ScreenUtil().setWidth(71),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: AppSpace.space_45),
                    child: Row(
                      children: [
                        Expanded(child: _Tab()),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          AppImages.in_05,
                          color: Colors.white,
                          width: AppSpace.space_45,
                          height: AppSpace.space_45,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        color: AppColors.color_31A76B,
                        height: ScreenUtil().setWidth(700),
                      )),
                      Positioned(
                          child: Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setWidth(180)),
                        height: ScreenUtil().setWidth(520),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppRadius.radius_100),
                                topRight:
                                    Radius.circular(AppRadius.radius_100))),
                      )),
                      Container(
                        // padding: EdgeInsets.only(top: AppSpace.space_25),
                        child: Column(
                          children: [
                            _Swiper(bannerList),
                            Padding(
                              padding: EdgeInsets.all(AppSpace.space_45),
                              child: _HomeEntry(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                      left: AppSpace.space_45, right: AppSpace.space_45),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate(
                          [_ShoVideo(), _SpecialZone(), _MainTitle()])),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                      left: AppSpace.space_45,
                      right: AppSpace.space_45,
                      bottom: AppSpace.space_45),
                  sliver: SliverGrid(
                    key: UniqueKey(),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GoodsItem(
                        key: UniqueKey(),
                        onTap: () {
                          Get.toNamed(RouteConfig.goods_detail_page);
                        },
                      );
                    }, childCount: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 475 / 735,
                        mainAxisSpacing: AppSpace.space_38,
                        crossAxisSpacing: AppSpace.space_38),
                  ),
                )
              ],
            ))
          ],
        );
      }),
    );
  }

  /** 搜索框 */
  Widget _SearchTextField() {
    return Container(
        height: ScreenUtil().setWidth(92),
        padding: EdgeInsets.fromLTRB(AppSpace.space_25, 0, 0, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.radius_20),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              color: AppColors.color_A2A2A2,
            ),
            SizedBox(
              width: AppSpace.space_25,
            ),
            Expanded(
                child: TextField(
              cursorHeight: 20,
              decoration: InputDecoration(
                labelText: '商品名称/规格/型号/首字母',
                labelStyle: TextStyle(color: AppColors.color_999999),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ))
          ],
        ));
  }

  /** tabs */
  Widget _Tab() {
    return TabBar(
      controller: _tabController,
      tabs: tabs,
      isScrollable: true,
      indicator: _TabIndicator(),
      labelColor: AppColors.color_FFF100,
      labelStyle: TextStyle(fontSize: AppFontsize.size_38),
      unselectedLabelColor: Colors.white,
      labelPadding: EdgeInsets.only(
          // right: AppSpace.space_45,
          top: AppSpace.space_45,
          bottom: AppSpace.space_45,
          left: AppSpace.space_45),
    );
  }

  /** 轮播图 */
  Widget _Swiper(List<SwiperItem> list) {
    return Container(
      // width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setWidth(440),
      child: Swiper(
          key: UniqueKey(),
          index: 0,
          duration: 500,
          itemCount: list.length,
          autoplay: true,
          pagination: SwiperPagination(builder: SwiperCustomPagination(builder:
              (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(list.length, (index) {
                  bool active = index == swiperPluginConfig.activeIndex;
                  return Opacity(
                    opacity: active ? 1 : 0.5,
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.only(left: 2.5, right: 2.5),
                        width: active
                            ? ScreenUtil().setWidth(51)
                            : ScreenUtil().setWidth(18),
                        height: ScreenUtil().setWidth(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        )),
                  );
                }));
          })),
          itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.only(
                    left: AppSpace.space_45, right: AppSpace.space_45),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(20)))),
                clipBehavior: Clip.hardEdge,
                child: CacheImage(url: list[index].url),
              )),
    );
  }

  /** 入口 */
  Widget _HomeEntry() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              AppImages.in01,
              width: ScreenUtil().setWidth(112),
              height: ScreenUtil().setWidth(112),
            ),
            Text('积分商城',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035))
          ],
        ),
        Column(
          children: [
            Image.asset(
              AppImages.in02,
              width: ScreenUtil().setWidth(112),
              height: ScreenUtil().setWidth(112),
            ),
            Text('奖金福利',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035))
          ],
        ),
        Column(
          children: [
            Image.asset(
              AppImages.in03,
              width: ScreenUtil().setWidth(112),
              height: ScreenUtil().setWidth(112),
            ),
            Text('邀请分享',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035))
          ],
        ),
        Column(
          children: [
            Image.asset(
              AppImages.in04,
              width: ScreenUtil().setWidth(112),
              height: ScreenUtil().setWidth(112),
            ),
            Text('在线客服',
                style: TextStyle(
                    fontSize: AppFontsize.size_38,
                    color: AppColors.color_2D3035))
          ],
        )
      ],
    );
  }

  /** 短视频专区 */
  Widget _ShoVideo() {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;
    paint.color = AppColors.color_0F50BC;
    return Padding(
      padding: EdgeInsets.only(top: AppSpace.space_45),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.radius_30)),
            child: Image.asset(AppImages.ncpa,
                fit: BoxFit.fill, height: ScreenUtil().setWidth(497)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '短视频专区',
                style:
                    TextStyle(fontSize: AppFontsize.size_72, foreground: paint),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '短视频专区',
                style: TextStyle(
                    fontSize: AppFontsize.size_72,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

/** 专区 */
Widget _SpecialZone() {
  return Container(
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.only(top: AppSpace.space_45),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(AppRadius.radius_30)),
    child: Image.asset(AppImages.ncp,
        fit: BoxFit.fill, height: ScreenUtil().setWidth(306)),
  );
}

/** 标题 */
Widget _MainTitle() {
  return Padding(
    padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(69), bottom: ScreenUtil().setWidth(69)),
    child: Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          color: AppColors.color_2CAE72,
        )),
        Container(
          alignment: Alignment.center,
          height: ScreenUtil().setWidth(57),
          width: ScreenUtil().setWidth(345),
          decoration: BoxDecoration(
              color: AppColors.color_2CAE72,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(57))),
          child: Text(
            '新品推荐',
            style: TextStyle(
                fontSize: AppFontsize.size_36,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Container(
          height: 1,
          color: AppColors.color_2CAE72,
        )),
      ],
    ),
  );
}

class _TabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CustomPainer();
  }
}

class _CustomPainer extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    final Paint paint = Paint();
    paint.strokeWidth = 0;
    canvas.drawLine(Offset.infinite, Offset.infinite, paint);
  }
}
