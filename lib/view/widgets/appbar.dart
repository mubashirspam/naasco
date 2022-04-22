import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:naasco_mart/view/widgets/icon_button.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final bool logo;
  const MyAppBar({Key? key, required this.title, this.logo = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
      height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {}, child: AppIconButton(iconData: Icons.menu)),
          Spacer(),
          logo
              ? SizedBox(
                  height: 35,
                  width: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SvgPicture.asset('assets/images/logo_icon.svg'),
                  ),
                )
              : SizedBox(),
          headerText(title),
          Spacer(),
          AppIconButton(
            iconData: Icons.shopping_cart,
          )
        ],
      ),
    );
  }
}
