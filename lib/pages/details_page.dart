import 'package:fashion_shop_uikit/data/vo/size_vo.dart';
import 'package:fashion_shop_uikit/resource/dimension.dart';
import 'package:fashion_shop_uikit/view_items/details_explict_session_view.dart';
import 'package:fashion_shop_uikit/view_items/details_session_view.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  void chooseSize(SizeVO sizeVO){
    setState((){
      sizeVOList.forEach((element) {
        if(element.title==sizeVO.title){
          element.isSelect=!element.isSelect;
        }
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const AppBarSessionView(),
          const SliverTopBoxAdapterSessionView(),
          SliverList(
              delegate: SliverChildListDelegate([
            const TitleSessionView(),
          const  SizedBox(
              height: kPadding20x,
            ),
           const  DescriptionSessionView(
            ),
          const  SizedBox(
              height: kPadding20x,
            ),

         SizeChooseSessionView(
           onTap: (sizeVO)=>chooseSize(sizeVO),
         ),
          ]))
        ],
      ),
    );
  }
}


