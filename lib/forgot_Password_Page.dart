import 'package:e_commerce/register_Page.dart';
import 'package:flutter/material.dart';

import 'OTP_Page.dart';
import 'logIn_Page.dart';


class Forgot_Password_Page extends StatefulWidget {
  const Forgot_Password_Page({super.key});

  @override
  State<Forgot_Password_Page> createState() => _Forgot_Password_PageState();
}

class _Forgot_Password_PageState extends State<Forgot_Password_Page> {
  @override
  Widget build(BuildContext context) => Scaffold(

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
              Text("Forgot Password", style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text("Please enter your email and we will send\nyou a link to return to your account", textAlign: TextAlign.center,),


              Padding(
                padding: const EdgeInsets.fromLTRB(30, 150, 30, 150),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter your email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),
                    suffixIcon: Icon(Icons.email_outlined),
                  ),
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

              SizedBox(height: 100,),

              Padding(padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                child: Row(
                  children: [
                    Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xfffb7a43),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register_Page()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }