import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  final VoidCallback voidCallback;

  const ButtonWidget({
    Key? key,
    required this.voidCallback,
    this.text = "button",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          onPrimary: AppColor.textColorOrang,
          shadowColor: AppColor.mainColor.withOpacity(0.4),
          primary: AppColor.mainColor,
          minimumSize: Size(200, 60),
          animationDuration: Duration(microseconds: 500),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35)),
      onPressed: voidCallback,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
