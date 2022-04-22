import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/view/screens/product_details_screen.dart';
import 'package:naasco_mart/view/widgets/icon_button.dart';
import 'widgets/texts.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // serach---------------//

          Container(
            // padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.maxFinite,
            height: 65,
            decoration: BoxDecoration(
              boxShadow: AppColor.SerchBoxShadow,
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                        hintText: 'Find a product...',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 26,
                  color: AppColor.mainColor,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 30,
                  width: 1,
                  color: Colors.grey[300],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    Icons.filter_alt_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.mainColor),
                )
              ],
            ),
          ),

          //----------------------

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: SizedBox(
                width: double.maxFinite,
                child: mainText("Recommended Product..")),
          ),

          // slider-----------------//
          //

          // GetBuilder<ProductController>(
          //   builder: ((products) =>

          Container(
            padding: EdgeInsets.only(left: 30),
            width: double.maxFinite,
            height: 150,
            // color: Colors.red,
            child: ListView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _recommendedItem(),
            ),
          ),
          // ),),

          // dots indicator-------------//

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
//=---------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: SizedBox(
                width: double.maxFinite, child: mainText("Popular Product..")),
          ),

          Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 320,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => _popularItem(
                  // products.productList[index],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedItem() => Container(
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
      );

  Widget _popularItem() => GestureDetector(
        onDoubleTap: () {
          print("taped");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetail(),
            ),
          );
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1977b86c),
                  blurRadius: 12,
                  offset: Offset(0, 2),
                ),
              ],
              color: Color(0xffDFF4E5),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            "https://drive.google.com/uc?id=1Z4KPT1bSMwM3_K_EPkf_9KsvlNRAuyFj"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mainText2("kg", Colors.grey.shade400),
                        SizedBox(
                          height: 5,
                        ),
                        mainText("Pineapple"),
                        mainText2("പൈനാപ്പിൾ", AppColor.mainColor),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppIconButton(
                                iconData: Icons.add,
                                radius: 30,
                                size: 35,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  "₹",
                                  style: TextStyle(
                                      color: AppColor.mainColor, fontSize: 18),
                                ),
                              ),
                              FittedBox(
                                child: priceText("67"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )),
      );
}
