import 'package:e_commerce/route/route.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen.callback(
        name: 'assets/loaders/loader2.flr',
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: '0',
        endAnimation: '5',
        backgroundColor: Colors.black,
        loopAnimation: 'Untitled',
        onError: (error, stacktrace) {
          print('error');
        },
        onSuccess: (data) {
          print('success');
          Navigator.of(context).pushReplacementNamed(ROUTE.home);
        },
      ),
    );
  }
}
