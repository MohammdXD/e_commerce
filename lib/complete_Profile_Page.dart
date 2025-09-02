import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Complete_Profile_Page extends StatefulWidget {
  const Complete_Profile_Page({super.key});

  @override
  State<Complete_Profile_Page> createState() => _CompleteProPageState();
}

class _CompleteProPageState extends State<Complete_Profile_Page> {
  void submit() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, '/otp');
    }
  }

  final _formkey = GlobalKey<FormState>();
  final firstnameControler = TextEditingController();
  final lastnameControler = TextEditingController();
  final phonenumberControler = TextEditingController();
  final addressControler = TextEditingController();

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
                "Complete Profile",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "Complete your details or continue\nwith social media",
                textAlign: TextAlign.center,
              ),

              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstnameControler,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'please enter your first name'
                            : null,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter your first Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
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

                      SizedBox(height: 30),
                      TextFormField(
                        controller: lastnameControler,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'please enter your last name'
                            : null,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter your last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
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

                      SizedBox(height: 30),

                      TextFormField(
                        controller: phonenumberControler,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'please enter your phone number'
                            : null,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter your Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
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

                      SizedBox(height: 30),

                      TextFormField(
                        controller: addressControler,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'please enter your address'
                            : null,
                        decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter your Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
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

              SizedBox(height: 60),

              Text(
                "By continuing your confirm that you agree\nwith our Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
