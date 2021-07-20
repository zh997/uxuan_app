import 'package:flutter/cupertino.dart';

class Price extends StatelessWidget {
  final Color color;
  final String price;
  final double size;
  final double unitSize;
  final double bottom;
  final bool isShowUnit;
  final MainAxisAlignment mainAxisAlignment;
  Price(
      {required this.color,
      required Key key,
      required this.price,
      required this.size,
      this.bottom = 1.8,
      required this.unitSize,
      required this.mainAxisAlignment,
      this.isShowUnit = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        isShowUnit
            ? Padding(
                padding: EdgeInsets.only(bottom: bottom),
                child: Text('¥',
                    style: TextStyle(
                        fontSize: unitSize,
                        color: color,
                        fontWeight: FontWeight.bold)))
            : SizedBox(),
        Text('${price}',
            style: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.bold))
      ],
    );
  }
}
