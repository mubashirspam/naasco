import 'package:flutter/material.dart';
import 'package:naasco_mart/controller/auth_controller.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/utlis/controllers.dart';
import 'package:naasco_mart/view/screens/signup_page.dart';
import 'package:naasco_mart/view/widgets/button_widget.dart';
import 'package:naasco_mart/view/widgets/texts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      // backgroundColor: AppColor.mainColor,
      body: Container(
        height: double.infinity,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainText(
                "Loigin",
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 100),
                height: 250,
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.mainColor.withOpacity(0.1),
                              offset: Offset(0, 4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: TextFormField(
                          cursorColor: AppColor.mainColor,
                          controller: authController.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColor.mainColor,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 15, right: 15),
                            hintText: "emaile",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: AppColor.mainColor,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: AppColor.mainColor.withOpacity(0.1),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        )
                      ]),
                      child: TextFormField(
                        cursorColor: AppColor.mainColor,
                        controller: authController.password,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.mainColor,
                          ),
                          contentPadding: EdgeInsets.only(left: 15, right: 15),
                          hintText: "password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: AppColor.mainColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: AppColor.mainColor,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                voidCallback: () {
                  AuthController.instance.login();
                },
                text: "Login",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Dont have an account ?",
                        style: TextStyle(
                            color: AppColor.textColorGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        children: [
                          TextSpan(
                            text: " Create",
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
