import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsapp/ui/screens/home_screen.dart';
import 'package:newsapp/ui/utils/image_paths.dart';

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
    goToHomeScreen();
  }

  void goToHomeScreen(){
    Future.delayed(const Duration(seconds: 2)).then((value) => {
      Get.offAll(const HomeScreen())
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(ImagePaths.newsAppLogoSVG, width:  200,),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(height: 16,),
              const Text("Version 1.0.0"),
              const SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
}