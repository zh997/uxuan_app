import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uxuan_app/components/empty.dart';
import 'package:uxuan_app/constant/app_colors.dart';
import 'package:uxuan_app/constant/app_space.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color_2CAE72,
        title: Text('购物车'),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: AppSpace.space_45),
            child: Text('编辑'),
          )
        ],
      ),
      body: Column(
        children: [
          Empty(
            key: GlobalKey(),
            text: '您的购物车空空如也',
            onTap: () {},
            btnText: '去逛逛',
          )
        ],
      ),
    );
  }
}
