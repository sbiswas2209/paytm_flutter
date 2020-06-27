import 'package:flutter/material.dart';
import 'package:paytm_naaniz/pages/homePage.dart';
import 'package:paytm_naaniz/pages/paymentScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String , WidgetBuilder>{
    HomePage.tag : (context) => new HomePage(),
    PaymentScreen.tag : (context) => new PaymentScreen(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}

