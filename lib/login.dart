import 'dart:convert';

import 'package:covid19_mobile/home/nav.dart';
import 'package:covid19_mobile/register.dart';
import 'package:covid19_mobile/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "", "", "", "", "", "", "", "", "");
  String url = "http://192.168.8.101:3001/api/citizens/login";

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Nav(),
          ));
    } else {
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 750,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Login",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                            focusColor: Colors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: GoogleFonts.roboto(
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                            focusColor: Colors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Dont have Account ?",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: FlatButton(
                      color: Color.fromRGBO(233, 65, 82, 1),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          save();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )),
      ),
    );
  }
}
