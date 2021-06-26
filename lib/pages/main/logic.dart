import 'package:get/get.dart';

import 'state.dart';

class MainLogic extends GetxController {
  final state = MainState();

  void onChangePage(int index) {
    state.page_index.value = index;
  }
}
