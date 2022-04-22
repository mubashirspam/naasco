import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/utlis/controllers.dart';
import 'package:naasco_mart/view/screens/product_details_screen.dart';
import 'package:naasco_mart/view/widgets/icon_button.dart';
import 'package:naasco_mart/view/widgets/popular_product.dart';
import 'package:naasco_mart/view/widgets/recommended_product.dart';
import 'texts.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  

  @override
  Widget build(BuildContext context) {
    var productlist = producsController.products;
    print("pruductlist : ${productlist}");
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
          RecommendedProuct(),
         
//=---------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: SizedBox(
                width: double.maxFinite, child: mainText("Popular Product..")),
          ),
          PopularProduct(),
        ],
      ),
    );
  }

}
