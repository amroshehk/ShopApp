import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/BoardingModel.dart';
import 'login/shop_login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  bool isLast = false;
  List<BoardingModel> boardings = [
    BoardingModel(image: 'assets/images/purchase_online.png', title: 'Purchase Online !!', subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor ut labore'),
    BoardingModel(image: 'assets/images/track_order.png', title: 'Track order !!', subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor ut labore'),
    BoardingModel(image: 'assets/images/get_your_order.png', title: 'Get your order !!',  subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor ut labore'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(function: () {
            navigateToAndFinish(context, ShopLoginScreen());
          },title:  'SKIP')
        ],
      ),
      body:Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => buildBoardingItem(boardings[index]),
            physics: BouncingScrollPhysics(),
            itemCount: boardings.length,
              onPageChanged: (value) {

                if(value == boardings.length -1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                    controller: pageController,  // PageController
                    count:  boardings.length,
                    effect:  ExpandingDotsEffect(
                      dotColor: HexColor("cccccc"),
                      activeDotColor: HexColor("037EE6"),
                      dotWidth: 10,
                      dotHeight: 10,
                      expansionFactor: 4,
                      spacing: 5.0
                    ),  // your preferred effect
                    onDotClicked: (index){

                    },
                  
                ),
                const Spacer(),
                FloatingActionButton(onPressed: () {
                  if(isLast){
                    navigateToAndFinish(context, ShopLoginScreen());
                    return;
                  }
                  pageController.nextPage(duration: Duration( milliseconds: 250), curve: Curves.bounceInOut);
                },
                child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel boarding) => Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(child: Image(image: AssetImage(boarding.image))),
          SizedBox(height: 30.0,),
          Text(boarding.title,style: TextStyle(fontSize: 24.0),),
          SizedBox(height: 30.0,),
          Text(boarding.subTitle,style: TextStyle(fontSize: 14.0),),
          SizedBox(height: 30.0,),

        ],
      ),
    ),
  );
}
