import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'OTP_Page.dart';

class Complete_Profile_Page extends StatefulWidget {
  const Complete_Profile_Page({super.key});

  @override
  State<Complete_Profile_Page> createState() => _CompleteProPageState();
}

class _CompleteProPageState extends State<Complete_Profile_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppBar(
                leading: BackButton(),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40,),
              Text("Complete Profile", style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text("Complete your details or continue\nwith social media", textAlign: TextAlign.center,),

              Padding(
                padding: EdgeInsets.fromLTRB(30, 70, 30, 100),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your first Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/icons/User.svg",
                            width: 15,
                            height: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your last Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/icons/User.svg",
                            width: 15,
                            height: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 30,),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your Phone Number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/icons/Phone.svg",
                            width: 15,
                            height: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your Address",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/icons/Location point.svg",
                            width: 15,
                            height: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 330,
                height: 50,
                child: ElevatedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTP_Page()),
                  );
                },
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),),
                  ),
                  child: Text("Continue"),
                ),
              ),

              SizedBox(height: 70,),

              Text("By continuing your confirm that you agree\nwith our Term and Condition",textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}