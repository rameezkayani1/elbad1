import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/menupage.dart';

class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = "";
  String _Password = "";
  bool passenable = true;
  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _Password,
      );
      print("sign in created ${userCredential.user!.email}");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => menuPage()),
      );
    } catch (e) {
      SnackBar(content: Text('login Failed , Please Try again .'));

      print("Error during login $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(27),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 150),

                        // padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Welcome Back, Login',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF03DAA1),
                          ),
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 31),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        onChanged: (Value) {
                          setState(() {
                            _email = Value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        controller: loginEmailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),

                          filled: true, //<-- SEE HERE
                          fillColor: Color(0xFF063A34),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),

                          hintText: 'ID/Username',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 4),
                      child: TextFormField(
                        obscureText: passenable,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        onChanged: (Value) {
                          setState(() {
                            _Password = Value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        controller: loginPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passenable = !passenable;
                                  print("$passenable");
                                  // if (passenable) {
                                  //   passenable = false;
                                  // } else {
                                  //   passenable =
                                  //       true; //if passenable == false, make it true
                                  // }
                                });
                              },
                              icon: Icon(passenable == true
                                  ? Icons.remove_red_eye
                                  : Icons.password)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor: Color(0xFF063A34),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          hintText: 'Password',

                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        // padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        )),
                    SizedBox(
                      height: 29,
                    ),
                    Container(
                      height: 61,
                      width: 321,
                      decoration: BoxDecoration(
                          color: Color(0xff03DABB),
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff03DABB), // background
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             bottomscreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget backgroudImage() {
    return
        //  ShaderMask(
        //   shaderCallback: (bounds) => LinearGradient(
        //     colors: [Colors.black, Colors.black12],
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.center,
        //   ).createShader(bounds),
        //   blendMode: BlendMode.darken,
        //   child:
        Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/loginMa.jpg'),

          /// change this to your  image directory
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}
