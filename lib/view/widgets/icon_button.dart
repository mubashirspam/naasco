

import 'package:flutter/material.dart';

import '../../utlis/app_constants.dart';

class AppIconButton extends StatelessWidget {
  final double radius;
  final IconData iconData;
  final double size;

  const AppIconButton({
    this.radius = 0,
    required this.iconData,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? 50 : size,
      height: size == 0 ? 50 : size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius == 0 ? 12 : radius,
        ),
        color: AppColor.secondaryColor,
      ),
      child: Center(
        child: Icon(
          iconData,
          color: AppColor.mainColor,
        ),
      ),
    );
  }
}
