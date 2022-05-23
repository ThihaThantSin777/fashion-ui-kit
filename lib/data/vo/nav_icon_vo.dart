import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:flutter/material.dart';

class NavIconVO {
  Widget widget;
  bool isBadage;

  NavIconVO(this.widget, this.isBadage);

  @override
  String toString() {
    return 'NavIconVO{widget: $widget, isBadage: $isBadage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavIconVO &&
          runtimeType == other.runtimeType &&
          widget == other.widget &&
          isBadage == other.isBadage;

  @override
  int get hashCode => widget.hashCode ^ isBadage.hashCode;
}

List<NavIconVO> navIconVOList = [
  NavIconVO(
      const Icon(
        Icons.home,
        color: Colors.indigo,
        size: 33,
      ),
      false),
  NavIconVO(
      const Icon(
        Icons.search,
        color: Colors.black38,
        size: 33,
      ),
      false),
  NavIconVO(
      const Icon(
        Icons.date_range,
        color: Colors.black38,
        size: 33,
      ),
      true),
  NavIconVO(
      const Icon(
        Icons.bookmark,
        color: Colors.black38,
        size: 33,
      ),
      false),
  NavIconVO(
      const CircleAvatar(
        radius: kImageCircularChatSize,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
            'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
      ),
      false),
];
