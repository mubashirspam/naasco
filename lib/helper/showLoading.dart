import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naasco_mart/utlis/app_constants.dart';

showLoading() {
  Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Loading...",
      content: CircularProgressIndicator(
        backgroundColor: AppColor.textColorOrang,
        color: AppColor.mainColor,
      ),
      barrierDismissible: false);
}

dismissLoadingWidget() {
  Get.back();
}
