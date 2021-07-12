import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uxuan_app/pages/main/view.dart';

import 'common/routes.dart';

void main() {
  runApp(MyApp());
  //白色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '49优选',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
        builder: (BuildContext context, child) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child != null ? child : SizedBox(),
          );
        },
        home: MainPage(),
        defaultTransition: Transition.cupertino,
        getPages: routes,
      ),
    );
  }
}
