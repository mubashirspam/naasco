import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naasco_mart/view/widgets/button_widget.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

import '../../controller/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  final String ? email;
  const ProfilePage({
    Key? key, this.email,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
   var auth=  Get.find<AuthController>();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonWidget(
            voidCallback: () {auth.logOut();},
            
            text: 'Logout',
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: mainText("data"),
          )
        ],
      ),
    );
  }
}
