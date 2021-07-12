import 'package:get/get.dart';
import 'package:uxuan_app/constant/app_images.dart';

class HomeState {
  RxList<SwiperItem> bannerList = [
    SwiperItem(AppImages.banner1),
    SwiperItem(AppImages.banner2),
    SwiperItem(AppImages.banner3),
    SwiperItem(AppImages.banner4),
  ].obs;

  HomeState() {
    ///Initialize variables
  }
}

class SwiperItem {
  final String url;
  SwiperItem(this.url);
}
