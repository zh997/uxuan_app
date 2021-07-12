import 'package:get/get.dart';
import 'package:uxuan_app/pages/cart/view.dart';
import 'package:uxuan_app/pages/goods_detail/view.dart';
import 'package:uxuan_app/pages/home/view.dart';

class RouteConfig {
  static String home_page = '/home_page';
  static String cart_page = '/cart_page';
  static String goods_detail_page = '/goods_detail_page';
}

List<GetPage> routes = [
  GetPage(name: RouteConfig.home_page, page: () => HomePage()),
  GetPage(name: RouteConfig.cart_page, page: () => CartPage()),
  GetPage(name: RouteConfig.goods_detail_page, page: () => GoodsDetailPge())
];
