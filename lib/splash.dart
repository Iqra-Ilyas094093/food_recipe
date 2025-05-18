import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/main.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            splash: LottieBuilder.asset('assets/images/food_recipe.json'),
            nextScreen: MyHomePage(),
            splashIconSize: 350,
          duration: 1200,
        ),
    );
  }
}
