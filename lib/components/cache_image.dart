import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatefulWidget{
  final String url;
  const CacheImage({Key? key, required this.url}) : super(key: key);

  @override
  _CacheImageState createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin  {
  late AnimationController _animationController;

  @override
  initState(){
    super.initState();
    _animationController = new AnimationController(duration: Duration(milliseconds: 800) ,vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   print(widget.url);
    return ExtendedImage.network(
      widget.url,
      fit: BoxFit.cover,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _animationController.reset();
            return Container(
              color: Colors.white,
            );
            break;
        ///if you don't want override completed widget
        ///please return null or state.completedWidget
        //return null;
        //return state.completedWidget;
          case LoadState.completed:
            _animationController.forward();
            return FadeTransition(
              opacity: _animationController,
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
              ),
            );
            break;
          case LoadState.failed:
            _animationController.reset();
            return Container(
              color: Colors.white,
            );
            break;
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
