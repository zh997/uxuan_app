import 'package:get/get.dart';
import 'package:uxuan_app/pages/home/view.dart';

class RouteConfig {
  static String home_page = '/pages.home_page';
}

List<GetPage> routes = [
  GetPage(name: RouteConfig.home_page, page: () => HomePage())
];
