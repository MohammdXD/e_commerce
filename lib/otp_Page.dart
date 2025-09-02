import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';

class OTP_Page extends StatefulWidget {
  const OTP_Page({super.key});

  @override
  State<OTP_Page> createState() => OTP_PageState();
}

class OTP_PageState extends State<OTP_Page> {
  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login');
    }
  }

  final _formkey = GlobalKey<FormState>();
  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              leading: const BackButton(),
              backgroundColor: Colors.white,
              elevation: 0,
            ),

            const SizedBox(height: 40),

            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: "We sent your code to +1 898 860 ***\n"),
                  TextSpan(text: "This code will expire in "),
                  TextSpan(
                    text: "00:13",
                    style: TextStyle(
                      color: Color(0xFFff7643),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 150, 30, 100),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextFormField(
                        controller: otp1Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextFormField(
                        controller: otp2Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextFormField(
                        controller: otp3Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextFormField(
                        controller: otp4Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
            HyperLink(
              text: '[Resend OTP Code]()',
              textStyle: TextStyle(color: Colors.black, fontSize: 14),
              linkStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
