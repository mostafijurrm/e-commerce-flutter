import 'package:e_commerce/route/route.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/product_details_screen.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:e_commerce/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: ROUTE.splash,
      routes: {
        ROUTE.splash : (_) => Splash(),
        ROUTE.home : (_) => HomeScreen(),
        ROUTE.productDetails : (_) => ProductDetailsScreen(),
      },
    );
  }
}
