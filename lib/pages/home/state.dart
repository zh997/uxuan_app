import 'package:get/get.dart';
import 'package:uxuan_app/constant/app_images.dart';

class HomeState {
  RxList<SwiperItem> bannerList = [
    SwiperItem('http://101.34.79.122:3000/images/banner1.png'),
    SwiperItem('http://101.34.79.122:3000/images/banner2.png'),
    SwiperItem('http://101.34.79.122:3000/images/banner3.png'),
    SwiperItem('http://101.34.79.122:3000/images/banner4.png'),
  ].obs;

  HomeState() {
    ///Initialize variables
  }
}

class SwiperItem {
  final String url;
  const SwiperItem(this.url);
}
