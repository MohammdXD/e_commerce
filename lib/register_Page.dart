import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
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
      Navigator.pushNamed(context, AppRoutes.completeProfile);
    }
  }

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppBar(leading: BackButton(), backgroundColor: Colors.white),
              SizedBox(height: 40),
              Text(
                "Register Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "Complete your details or continue\nwith social media",
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

                      SizedBox(height: 30),

                      TextFormField(
                        controller: conpasswordController,
                        validator: (value) {
                          if (value != passwordController.text ||
                              value == null) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Conform Password",
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Re-enter your password",
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

              SizedBox(height: 70),
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

              SizedBox(height: 50),

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
              Text("By continuing your confirm thal your agree"),
            ],
          ),
        ),
      ),
    );
  }
}
