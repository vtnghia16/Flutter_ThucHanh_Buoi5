import 'package:flutter/material.dart';
import 'package:untitled/components/default_button.dart';
import 'package:untitled/screens/home/home_screen.dart';
import 'package:untitled/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Expanded(
          flex: 4, // Adjust the flex value to control the image height
          child: Image.asset(
            "assets/images/success.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(flex: 2), // Adjust the flex value for spacing
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        const Spacer(flex: 2), // Adjust the flex value for spacing
      ],
    );
  }
}
