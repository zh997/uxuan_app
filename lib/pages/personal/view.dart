import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PersonalPage extends StatelessWidget {
  final PersonalLogic logic = Get.put(PersonalLogic());
  final PersonalState state = Get.find<PersonalLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
