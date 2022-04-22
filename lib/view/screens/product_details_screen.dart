import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/view/widgets/button_widget.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

import '../widgets/icon_button.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: AppIconButton(iconData: Icons.arrow_back_ios)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    child: AppIconButton(
                      iconData: Icons.shopping_cart,
                    ),
                  ),
                )
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mainText("Pineapple"),
                              mainText2("പൈനാപ്പിൾ ", AppColor.mainColor),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              greyText("kilogram"),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontSize: 18),
                                    ),
                                  ),
                                  priceText("134"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            backgroundColor: Color(0xffF6F7F8),
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              "https://drive.google.com/uc?id=1Z4KPT1bSMwM3_K_EPkf_9KsvlNRAuyFj",
              width: double.maxFinite,
              fit: BoxFit.fitHeight,
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: mainText("Discount Chart..."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "More than 5 unit",
                              style: TextStyle(
                                  color: AppColor.textColorGrey, fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              "₹",
                              style: TextStyle(
                                  color: AppColor.mainColor, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "10/Box",
                              style: TextStyle(
                                  color: AppColor.textColorOrang, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColor.textColorGrey,
                      height: 1,
                      width: double.maxFinite,
                      margin:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "More than 5 unit",
                              style: TextStyle(
                                  color: AppColor.textColorGrey, fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              "₹",
                              style: TextStyle(
                                  color: AppColor.mainColor, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "10/Box",
                              style: TextStyle(
                                  color: AppColor.textColorOrang, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 120,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x1977b86c),
                blurRadius: 27,
                offset: Offset(0, -4),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  greyText("Total :"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          "₹",
                          style: TextStyle(
                              color: AppColor.mainColor, fontSize: 18),
                        ),
                      ),
                      priceText("2998"),
                    ],
                  )
                ],
              ),
            ),
            ButtonWidget(
              voidCallback: () {},
            )
          ],
        ),
      ),
    );
  }
}
