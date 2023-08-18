// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/screens/splash/components/body.dart';
import 'package:untitled/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}