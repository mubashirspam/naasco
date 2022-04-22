import 'package:flutter/material.dart';
import 'package:naasco_mart/controller/auth_controller.dart';
import 'package:naasco_mart/view/screens/login_screen.dart';
import 'package:naasco_mart/view/widgets/button_widget.dart';

import '../../utlis/app_constants.dart';
import '../widgets/texts.dart';

class SignupPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
     
     var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mainText(
            "SignUp",
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100),
            height: 300,
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: AppColor.mainColor.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    )
                  ]),
                  child: TextFormField(
                    cursorColor: AppColor.mainColor,
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15, right: 15),
                      hintText: "Name",
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: AppColor.mainColor.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      )
                    ]),
                    child: TextFormField(
                      cursorColor: AppColor.mainColor,
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColor.mainColor,
                        ),
                        contentPadding: EdgeInsets.only(left: 15, right: 15),
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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: AppColor.mainColor.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    )
                  ]),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: AppColor.mainColor,
                    controller: passwordController,
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.red,
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
            voidCallback: () {AuthController.instance.register(
                emailController.text.trim(),
                passwordController.text.trim(),
                nameController.text.trim());},
          
            text: "Signup",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                "alredy have an acoount? Login",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    );
  }
}
