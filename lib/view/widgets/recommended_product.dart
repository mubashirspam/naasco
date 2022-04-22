import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

class RecommendedProuct extends StatefulWidget {
  const RecommendedProuct({Key? key}) : super(key: key);

  @override
  State<RecommendedProuct> createState() => _RecommendedProuctState();
}

class _RecommendedProuctState extends State<RecommendedProuct> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _pageCurrentVaue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _pageCurrentVaue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30),
          width: double.maxFinite,
          height: 150,
          // color: Colors.red,
          child: ListView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0c77b86c),
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1571680322279-a226e6a4cc2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dG9tYXRvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                          ),
                          fit: BoxFit.cover),
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          mainText2("Tomato", AppColor.mainColor),
                          mainText2("തക്കാളി", AppColor.textColorOrang),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "₹",
                      style: TextStyle(color: AppColor.mainColor, fontSize: 18),
                    ),
                  ),
                  priceText("34"),
                ],
              ),
            ),
          ),
        ),
        DotsIndicator(
          position: _pageCurrentVaue,
          dotsCount: 5,
          decorator: DotsDecorator(
            color: Colors.grey.shade400,
            activeColor: AppColor.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
