import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';

Widget headerText(String data) => Text(
      data,
      style: TextStyle(
        color: AppColor.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );

//-------------------------------//

Widget mainText(String data) => Text(
      data,
      style: TextStyle(
        color: AppColor.textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
//-------------------------------//

Widget mainText2(String data, Color color) => Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: 20,
      ),
    );
//-------------------------------//

Widget priceText(String data) => Text(
      data,
      style: TextStyle(
        color: AppColor.textColorOrang,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
    Widget greyText(String data) => Text(
      data,
      style: TextStyle(
        color: AppColor.textColorGrey,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
