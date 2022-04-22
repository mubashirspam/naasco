import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/view/screens/product_details_screen.dart';
import 'package:naasco_mart/view/widgets/icon_button.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    // Obx(
    //   () =>
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
          itemBuilder: (context, index) => GestureDetector(
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
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          color: AppColor.mainColor,
                                          fontSize: 18),
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
          ),
        ),
      // ),
    );
  }
}
