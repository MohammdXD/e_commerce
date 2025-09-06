import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyperlink/hyperlink.dart';
import 'main.dart';

class welcome_Page extends StatefulWidget {
  const welcome_Page({super.key});

  @override
  State<welcome_Page> createState() => _welcome_PageState();
}

class _welcome_PageState extends State<welcome_Page> {
  int _current = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SafeArea(child: Container(child: const Text(''))),
            Text(
              "TOKOTO",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xfffb7a43),
              ),
            ),
            Text(
              "Welcome to Tokoto, Let's shop!",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 100),

            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enableInfiniteScroll: false,
                pauseAutoPlayOnManualNavigate: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: [
                Image.asset(
                  'assets/images/splash_1.png',
                  width: 250,
                  height: 300,
                ),
                Image.asset(
                  'assets/images/splash_2.png',
                  width: 230,
                  height: 300,
                ),
                Image.asset(
                  'assets/images/splash_3.png',
                  width: 250,
                  height: 300,
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _current == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _current == index ? Color(0xFFFF7643) : Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 200),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registerPage');
                },
                child: Text("Continue"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffb7a43),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
