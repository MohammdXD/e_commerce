import 'package:e_commerce/Proudict_page.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/main_page.dart';
import 'package:e_commerce/register_Page.dart';
import 'forgot_Password_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class logIn_Page extends StatefulWidget {
  const logIn_Page({super.key});

  @override
  State<logIn_Page> createState() => _logIn_PageState();
}

class _logIn_PageState extends State<logIn_Page> {
  final Uri googleUri = Uri.parse('https://flutter.dev');
  final Uri facebookUri = Uri.parse('https://flutter.dev');
  final Uri twitterUri = Uri.parse('https://flutter.dev');

  Future<void> _googleUri(Uri url) async {
    if (!await launchUrl(googleUri)) {
      throw Exception('Could not launch $googleUri');
    }
  }

  Future<void> _facebookUri(Uri url) async {
    if (!await launchUrl(facebookUri)) {
      throw Exception('Could not launch $facebookUri');
    }
  }

  Future<void> _twitterUri(Uri url) async {
    if (!await launchUrl(twitterUri)) {
      throw Exception('Could not launch $twitterUri');
    }
  }

  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, '/mainPage');
    }
  }

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            AppBar(leading: BackButton(), backgroundColor: Colors.white),
            SizedBox(height: 40),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign in with your email and password\n or continue with social media",
              textAlign: TextAlign.center,
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) =>
                          value == null || !value.contains("@")
                          ? 'Email is required'
                          : null,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                    ),

                    SizedBox(height: 30),

                    TextFormField(
                      controller: passwordController,
                      validator: (value) => value == null || value.length < 6
                          ? 'Password is required'
                          : null,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Color(0xFFff7643),
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Remember me"),

                  SizedBox(width: 60),

                  InkWell(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPasswordPage');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 330,
              height: 50,
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfffb7a43),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text("Continue"),
              ),
            ),

            SizedBox(height: 100),

            Padding(
              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _googleUri(googleUri);
                    },

                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xfff5f6f9),
                    ),
                    child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      _facebookUri(facebookUri);
                    },
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xfff5f6f9),
                    ),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      _twitterUri(twitterUri);
                    },
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color(0xfff5f6f9),
                    ),
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 5),

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
                      Navigator.pushNamed(context, '/registerPage');
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
