import 'package:flutter/material.dart';

class AppColor {
  static final Color mainColor = const Color(0xFF77B86C);
  static final Color textColor = const Color(0xFF484848);
  static final Color secondaryColor = const Color(0xFFDFF4E5);
  static final Color textColorOrang = const Color(0xFFF29D38);
  static final Color textColorGrey = const Color(0xFFBCBDBD);
  static final List<BoxShadow> buttonBoxShadow = [
    BoxShadow(
      color: Color(0x3358d674),
      blurRadius: 20,
      offset: Offset(0, 10),
    )
  ];
  static final List<BoxShadow> SerchBoxShadow = [
    BoxShadow(
      color: Color(0x3358d674).withOpacity(0.1),
      blurRadius: 20,
      offset: Offset(0, 5),
    )
  ];
}
