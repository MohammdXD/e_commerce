import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SplashPage.dart';
import 'Proudict_page.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash_Page(),
    //home: ProudictPage(),
  );
}
