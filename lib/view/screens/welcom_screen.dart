import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:naasco_mart/utlis/app_constants.dart';

import 'package:naasco_mart/view/screens/login_screen.dart';
import 'package:naasco_mart/view/widgets/button_widget.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  Tween<double> _ScaleTween = Tween(begin: 0, end: 1.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,

        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: TweenAnimationBuilder(
              duration: Duration(milliseconds: 1000),
              tween: _ScaleTween,
              builder: ((context, value, child) => Transform.scale(
                    scale: value as double,
                    child: child,
                  )),
              child: Container(
                // color: Colors.green.shade100,
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  "assets/images/home_img.svg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text("My Mart",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ButtonWidget(
              voidCallback: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              text: 'Get Started',
            ),
          ),
        ],
      ),
    );
  }
}
