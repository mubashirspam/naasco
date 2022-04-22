import 'package:flutter/material.dart';

import 'package:naasco_mart/utlis/app_constants.dart';



class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: CircularProgressIndicator(

              color: AppColor.textColorOrang,
              backgroundColor: AppColor.mainColor,
            ),
          ),
        ));
  }
}
