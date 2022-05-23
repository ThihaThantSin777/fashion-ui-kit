import 'package:fashion_shop_uikit/data/vo/size_vo.dart';
import 'package:fashion_shop_uikit/resource/colors.dart';
import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:fashion_shop_uikit/resource/string.dart';
import 'package:fashion_shop_uikit/view_items/details_explict_session_view.dart';
import 'package:flutter/material.dart';

class SizeChooseSessionView extends StatelessWidget {
  const SizeChooseSessionView({
    Key? key,
    required this.onTap
  }) : super(key: key);
  final Function(SizeVO) onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMargin10x),
          child: Row(
            children: const [
              Text(
                'Size your size',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: kFontSize18x),
              ),
              Spacer(),
              Text(
                'Size guide',
                style: TextStyle(fontSize: kFontSize15x, color: kChatColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kPadding20x,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMargin10x),
          child: Row(
            children: sizeVOList.map((e) => GestureDetector(
              onTap: ()=>onTap(e),
              child: AnimatedContainer(
                duration: kDuration1000milliSeconds,
                width: kChooseSizeBoxWidthAndHeight,
                height: kChooseSizeBoxWidthAndHeight,
                margin: const EdgeInsets.only(right: kMargin10x),
                decoration: BoxDecoration(
                  color: e.isSelect?kChatColor:Colors.white,
                  borderRadius: BorderRadius.circular(kPadding20x),
                  boxShadow: const[
                   BoxShadow(
                     color: Colors.black38,
                     blurRadius: 2,
                   )
                  ]
                ),
                child: Center(
                  child: Text(e.title,style: TextStyle(color: e.isSelect?Colors.white:Colors.black,fontSize: kFontSize17x),),
                ),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class TitleSessionView extends StatelessWidget {
  const TitleSessionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(
          height: kPadding20x,
        ),
        Text(
          kOutFitIdeaText,
          style: TextStyle(color: Colors.black38, fontSize: kFontSize18x),
        ),
        SizedBox(
          height: kPadding20x,
        ),
        Text(
          kModernBlueJacketText,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: kFontSize28x),
        ),
        SizedBox(
          height: kPadding20x,
        ),
        Text(
          '\$13,39',
          style: TextStyle(
              color: kChatColor,
              fontSize: kFontSize22x,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SliverTopBoxAdapterSessionView extends StatelessWidget {
  const SliverTopBoxAdapterSessionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: kChatColor,
        height: kPadding20x,
        child: Container(
          height: kPadding20x,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kPadding20x),
              topRight: Radius.circular(kPadding20x),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarSessionView extends StatelessWidget {
  const AppBarSessionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: kChatColor,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
              top: kPadding40x,
              child: Hero(
                  tag: 'assets/image.png',
                  child: Image.asset('assets/image.png')))
        ],
      ),
      actions: const [
        FavoriteIconSessionView(),
        SizedBox(
          width: kPadding20x,
        ),
        Icon(Icons.share),
        SizedBox(
          width: kPadding20x,
        ),
      ],
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
    );
  }
}

class SizeIcon extends StatelessWidget {
  const SizeIcon(
      {Key? key,
      required this.title,
      required this.animation,
      required this.isSelect,
      required this.onTap
      })
      : super(key: key);
  final String title;
  final Animation<Color?> animation;
  final bool isSelect;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: SizedBox(
        width: kChooseSizeBoxWidthAndHeight,
        height: kChooseSizeBoxWidthAndHeight,
        child: Card(
            color: animation.value,
            elevation: kMargin10x,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kPadding20x)),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: kFontSize25x,
                  color: isSelect ? Colors.white : Colors.black),
            ))),
      ),
    );
  }
}
