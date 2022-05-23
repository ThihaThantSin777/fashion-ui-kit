import 'package:fashion_shop_uikit/data/vo/nav_icon_vo.dart';
import 'package:fashion_shop_uikit/resource/colors.dart';
import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:fashion_shop_uikit/resource/string.dart';
import 'package:fashion_shop_uikit/widget/double_dotted_widget.dart';
import 'package:flutter/material.dart';



class NotificationView extends StatelessWidget {
  const NotificationView({
    Key? key,
    required this.onTap,
    required this.isChange
  }) : super(key: key);
  final Function onTap;
  final bool isChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kNotificationIconSizeWidth,
      height: kNotificationIconSizeHeight,
      child: GestureDetector(
        onTap: ()=>onTap(),
        child: Stack(
          children:  [
            Positioned.fill(
                child: Icon(
                  Icons.notifications,
                  size: kFontSize25x,
                    color: isChange?Colors.black:Colors.white
                )),
           const Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: kNotificationColorSize,
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleImageAndNamingView extends StatelessWidget {
  const CircleImageAndNamingView({
    Key? key,
    required this.isChange
  }) : super(key: key);
  final bool isChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: kCircularAvatarRadiusSize,
          backgroundImage: NetworkImage(
              'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
        ),
        const SizedBox(
          width: kMargin10x,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:  [
            Text(
              kHowdyText,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: kFontSize17x,color: isChange?Colors.black:Colors.white),
            ),
            Text(
              kCristianYotaText,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: kFontSize18x,color: isChange?Colors.black:Colors.white),
            )
          ],
        ),
      ],
    );
  }
}



class HeartSignIconView extends StatelessWidget {
  const HeartSignIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        top: kPadding20x,
        right: kPadding20x,
        child: CircleAvatar(
          backgroundColor: kNotificationHeartSignColor,
          child: Center(
            child: Icon(Icons.favorite_border,color: Colors.white,),
          ),
        )
    );
  }
}

class BottomLeftColumnTextView extends StatelessWidget {
  const BottomLeftColumnTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children:  [
        const Text(kNew2020Text,style: TextStyle(color: kTextColor,fontSize: kFontSize23x,fontWeight: FontWeight.w700),),
        const  SizedBox(
          height: kPadding20x,
        ),
        const SizedBox(
            width: kModernOutFitCollectionWidthSize,
            child: Text(kModernOutFitFashionText,style: TextStyle(color: Colors.white,fontSize: kFontSize25x,fontWeight: FontWeight.bold),)),
        const  SizedBox(
          height: kSizedBoxHeight,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children:const [
            CircleAvatar(
              radius: kImageCircularChatSize,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
            ),
            SizedBox(
              width: kMargin10x,
            ),
            Text(kNameText,style: TextStyle(color: kTextColor,fontSize: kFontSize17x,fontWeight: FontWeight.w600),)
          ],
        ),
      ],
    );
  }
}


class TrendingForYouTextAndDottedView extends StatelessWidget {
  const TrendingForYouTextAndDottedView({
    Key? key,
    required this.text,
    required this.color,
    required this.index,
    required this.isChange
  }) : super(key: key);
  final String text;
  final Color color;
  final int index;
  final bool isChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text,  style:  TextStyle(
            fontWeight: FontWeight.w700, fontSize: kFontSize17x,color: isChange?Colors.black:Colors.white),),
       const Spacer(),
        DoubleDottedWidget(widget:
        Row(
         mainAxisSize: MainAxisSize.min,
         children: List.generate(index, (i) =>  Padding(
           padding:  const EdgeInsets.only(left: kMargin10x),
           child: CircleAvatar(
             backgroundColor: (i==0)?color:Colors.grey,
             radius: kNotificationColorSize,
           ),
         )),
       ),
        )
      ],
    );
  }
}



class TrendingBoxView extends StatelessWidget {
  const TrendingBoxView({
    Key? key,
    required this.onTap
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding20x),
        color: kChatColor,
      ),
      child: GestureDetector(
        onTap: ()=>onTap(),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:  EdgeInsets.only(bottom: kPadding30x,left:  kPadding20x),
                child: BottomLeftColumnTextView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: 'assets/image.png',
                  child: Image.asset('assets/image.png')),
            ),
            const HeartSignIconView()
          ],
        ),
      ),
    );
  }
}


class BottomNavbarView extends StatelessWidget {
  const BottomNavbarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCardHeight,
      child: Card(
        elevation: kMargin10x,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPadding20x)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navIconVOList.map((data) {
            if(data.isBadage){
              return Stack(
                children: [

                  data.widget,
                  const Padding(
                    padding:   EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      backgroundColor: kNotificationHeartSignColor,
                      radius: 10,
                      child: Text('3',style: TextStyle(color: Colors.white,fontSize: 10),),
                    ),
                  ),
                ],
              );
            }
            return data.widget;
          }).toList(),
        ),
      ),
    );
  }
}