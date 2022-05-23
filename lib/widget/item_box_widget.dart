import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:flutter/material.dart';

class ItemBoxWidget extends StatelessWidget {
  const ItemBoxWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.imagePath,
    this.isPadding=false,
    required this.backGroundColor
  }) : super(key: key);
  final String imagePath;
  final Color color;
  final String text;
  final bool isPadding;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.17,
      width: MediaQuery.of(context).size.width*0.44,
      decoration: BoxDecoration(color: backGroundColor,borderRadius: BorderRadius.circular(kPadding20x)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath),
            isPadding? const SizedBox(
              height: kPadding20x,
            ):const SizedBox(),
            Text(text,style: TextStyle(color: color,fontSize: kFontSize15x,fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}