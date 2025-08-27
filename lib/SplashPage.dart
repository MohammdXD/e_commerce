import 'package:e_commerce/register_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:e_commerce/logIn_Page.dart';

class splash_Page extends StatefulWidget {
  const splash_Page({super.key});

  @override
  State<splash_Page> createState() => _splash_PageState();
}

class _splash_PageState extends State<splash_Page> {
  @override
  Widget build(BuildContext context) =>Scaffold(

        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SafeArea(child:
              Container(
                child: const Text(''),
              )),
              Text("TOKOTO", style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xfffb7a43),
              ),),
              Text("Welcome to Tokoto, Let's shop!", style: TextStyle(
                fontSize: 18,
              ),),

              SizedBox(height: 60,),

              Image.asset(
                'assets/images/splash_1.png',
                width: 250,
                height: 300,
              ),

              SizedBox(height: 250,),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => logIn_Page()),
                  );
                }, child:
                Text("Continue"),
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),),
                  ),
                ),
              ),
            ],
          ),
        )
  );
}