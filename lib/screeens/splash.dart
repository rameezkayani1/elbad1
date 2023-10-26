import 'package:flutter/material.dart';

import 'login.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => loginpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/spbg.png"),
            Image.asset("assets/sp.png"),
          ],
        ),
      ),
    );

    // Stack(children: [
    //   SplashbackgroudImage(),
    //   Scaffold(
    //     backgroundColor: Color(0xff0C1615),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           //  Text("DI Parking App" , style: TextStyle(color: Colors.white, fontSize: 29,fontWeight: FontWeight.w700)),

    //           // SizedBox(
    //           //   height: 10,
    //           // ),

    //           Image.asset("assets/sp.png"),
    //           // Image.asset("assets/plate.jpg"),
    //         ],
    //       ),
    //     ),
    //   ),
    // ]);
  }

  // ignore: non_constant_identifier_names
  Widget SplashbackgroudImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/spbg.png'),

          /// change this to your  image directory
          fit: BoxFit.cover,

          // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}
