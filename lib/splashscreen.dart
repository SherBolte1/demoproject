import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled/gridviewpage.dart';
import 'package:untitled/secondpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SecondPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/mobigic_logo_png.png",
            width: 200,
          )),
          SizedBox(
            height: 50,
          ),
          LoadingAnimationWidget.flickr(
            leftDotColor: const Color(0xFF0063DC),
            rightDotColor: const Color(0xFFFF0084),
            size: 50,
          ),
        ],
      ),
    );
  }
}
