
import 'package:fashion_shop_uikit/resource/colors.dart';
import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:fashion_shop_uikit/resource/string.dart';
import 'package:fashion_shop_uikit/view_items/home_session_view.dart';
import 'package:fashion_shop_uikit/widget/item_box_widget.dart';
import 'package:flutter/material.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWhiteColor = true;

  void navigateToDetailsView(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const DetailsPage();
    }));
  }

  void onTapForChangeBackGround() {
    setState(() {
      isWhiteColor = !isWhiteColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kThemeAnimationDuration,
        color: isWhiteColor?Colors.white:Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kPadding60x, horizontal: kPadding20x),
          child: Stack(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kDuration1000milliSeconds,
                builder: (context, double value, child) {
                  return Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: value * kMargin10x,
                        ),
                        child: child,
                      ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CircleImageAndNamingView(
                       isChange: isWhiteColor,
                     ),
                    const Spacer(),
                    NotificationView(
                      onTap: () => onTapForChangeBackGround(),
                      isChange: isWhiteColor,
                    ),
                  ],
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kDuration1000milliSeconds,
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: value * kMargin10x,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: kPadding80x),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         TrendingForYouTextAndDottedView(
                          text: kTrendingForYouText,
                          index: 2,
                          color: kChatColor,
                           isChange: isWhiteColor,
                        ),
                        const SizedBox(
                          height: kPadding20x,
                        ),
                        TrendingBoxView(onTap: () {
                          navigateToDetailsView(context);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: kDuration1000milliSeconds,
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: value * kPadding20x,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kPadding80x),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         TrendingForYouTextAndDottedView(
                          text: kRecommended,
                          index: 2,
                          color: kChatColor,
                           isChange: isWhiteColor,
                        ),
                        const SizedBox(
                          height: kPadding40x,
                        ),
                        Row(
                          children: const [
                            ItemBoxWidget(
                              imagePath: 'assets/shoes.png',
                              text: 'Shoes',
                              color: kNotificationHeartSignColor,
                              backGroundColor: kShoesColor,
                            ),
                            SizedBox(
                              width: kMargin10x,
                            ),
                            ItemBoxWidget(
                              imagePath: 'assets/cactus.png',
                              text: 'Cactus',
                              color: Colors.indigo,
                              isPadding: true,
                              backGroundColor: kCactusColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                  alignment: Alignment.bottomCenter, child: BottomNavbarView())
            ],
          ),
        ),
      ),
    );
  }
}
