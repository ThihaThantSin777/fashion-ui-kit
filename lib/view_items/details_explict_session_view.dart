
import 'package:fashion_shop_uikit/data/vo/size_vo.dart';
import 'package:fashion_shop_uikit/resource/colors.dart';
import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:fashion_shop_uikit/view_items/details_session_view.dart';
import 'package:flutter/material.dart';





class DescriptionSessionView extends StatefulWidget {
  const DescriptionSessionView(
      {Key? key})
      : super(key: key);


  @override
  State<DescriptionSessionView> createState() => _DescriptionSessionViewState();
}

class _DescriptionSessionViewState extends State<DescriptionSessionView> with TickerProviderStateMixin{
   bool isShowDescription=false;
   bool isCompleteExpend=false;

   late AnimationController _controller;
   @override
   void initState() {
     super.initState();
     _controller=
         AnimationController(vsync: this, duration:kDuration1000milliSeconds);

   }

   @override
   void dispose() {
     super.dispose();
     _controller.dispose();
   }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMargin10x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                'Descriptions',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: kFontSize18x),
              ),
              const Spacer(),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: IconButton(
                  icon: const Icon(Icons.expand_less),
                  onPressed: () {
                    setState(() {
                      isShowDescription=!isShowDescription;
                      if (isCompleteExpend) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      isCompleteExpend=!isCompleteExpend;
                    });
                  },
                ),
              )
            ],
          ),
          AnimatedSize(
              duration: kDuration1000milliSeconds,
              child:  SizedBox(
                height: isShowDescription?null:0,
                child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              )

          )
        ],
      ),
    );
  }
}


class FavoriteIconSessionView extends StatefulWidget {
  const FavoriteIconSessionView({Key? key}) : super(key: key);

  @override
  State<FavoriteIconSessionView> createState() => _FavoriteIconSessionViewState();
}

class _FavoriteIconSessionViewState extends State<FavoriteIconSessionView> with TickerProviderStateMixin{

  late AnimationController _controller;
  late final AnimationController _controllerForColor;
  late Animation<Color?> animation;
  bool isCompleteRotate=false;
  bool isFavorite=false;
  @override
  void initState() {
    super.initState();
    _controller=
        AnimationController(vsync: this, duration:kDuration1000milliSeconds);

    _controllerForColor = AnimationController(
        duration: kDuration1000milliSeconds, vsync: this);
   animation = ColorTween(begin: Colors.white,end: Colors.red).animate(_controllerForColor.view);
    _controllerForColor.addStatusListener((status) {
      isFavorite=(status==AnimationStatus.completed);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: IconButton(onPressed: (){
        setState(() {

          if (isCompleteRotate) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          isCompleteRotate=!isCompleteRotate;

          if(isFavorite){
            _controllerForColor.reverse();
          }else{
            _controllerForColor.forward();
          }
        });
      }, icon: AnimatedBuilder(
          animation: _controllerForColor.view,
          builder: (context,_){
            return  Icon(isFavorite?Icons.favorite:Icons.favorite_border,color: animation.value,);
          }
      )
      ),
    );
  }
}


