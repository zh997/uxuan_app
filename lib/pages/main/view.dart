import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_images.dart';
import 'package:uxuan_app/constant/app_init.dart';
import 'package:uxuan_app/pages/cart/view.dart';
import 'package:uxuan_app/pages/home/view.dart';
import 'package:uxuan_app/pages/personal/view.dart';

import 'logic.dart';
import 'state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;
  final PageController _pageController =
      PageController(initialPage: AppInit.initialPage, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HomePage();
            }
            if (index == 1) {
              return CartPage();
            }
            if (index == 2) {
              return PersonalPage();
            }
            return SizedBox();
          }),
      bottomNavigationBar: Obx(() {
        final int page_index = state.page_index.value;
        return BottomNavigationBar(
          currentIndex: page_index,
          selectedItemColor: AppColors.color_2CAE72,
          selectedFontSize: 12.0,
          onTap: (int index) {
            logic.onChangePage(index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: _bottomNavigationBarIcon(AppImages.nvbar_home_icon),
                activeIcon: _bottomNavigationBarIcon(
                    AppImages.nvbar_home_icon_selected),
                label: '首页'),
            BottomNavigationBarItem(
                icon: _bottomNavigationBarIcon(AppImages.nvbar_cart_icon),
                activeIcon: _bottomNavigationBarIcon(
                    AppImages.nvbar_cart_icon_selected),
                label: '购物车'),
            BottomNavigationBarItem(
                icon: _bottomNavigationBarIcon(AppImages.nvbar_personal_icon),
                activeIcon: _bottomNavigationBarIcon(
                    AppImages.nvbar_personal_icon_selected),
                label: '我的')
          ],
        );
      }),
    );
  }

  Image _bottomNavigationBarIcon(String imgUrl) {
    return Image.asset(
      imgUrl,
      width: ScreenUtil().setWidth(65),
      height: ScreenUtil().setWidth(65),
    );
  }
}
