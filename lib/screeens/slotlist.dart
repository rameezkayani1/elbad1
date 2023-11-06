import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/screeens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class sorting extends StatefulWidget {
  const sorting({super.key});

  @override
  State<sorting> createState() => _sortingState();
}

class _sortingState extends State<sorting> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => loginpage(),
      ),
    );
  }

  var now = new DateTime.now();
  var formatter = DateFormat('yMd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("uid").limit(12).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Stack(children: [
          backgroudImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              centerTitle: true,
              leading: InkWell(
                child: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                onTap: _signOut,
              ),
              title: Text(
                "Parking slots",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "$formatter",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: Text(
                          "Row 01",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Text(
                          "Row 02",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flex(direction: Axis.vertical, children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.8 / 1.2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white60),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            height: 25,
                            alignment: Alignment.center,
                            //         width: MediaQuery.of(context).size.width / 2,
                            child: Image.asset(
                              "assets/bike.png",
                              fit: BoxFit.cover,
                              height: 53,
                              width: 65,
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  Widget backgroudImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/BikeMap.jpg'),

          /// change this to your  image directory
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}
