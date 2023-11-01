import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/screeens/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'accountRecover.dart';

// ignore: must_be_immutable
class DocumentDetailPage extends StatefulWidget {
  final Map<String, dynamic> documentData;

  DocumentDetailPage(this.documentData);

  @override
  State<DocumentDetailPage> createState() => _DocumentDetailPageState();
}

class _DocumentDetailPageState extends State<DocumentDetailPage> {
  // var phoneNumber = documentData['Phone Number'];
  FirebaseAuth auth = FirebaseAuth.instance;
  // var myVariable = "${widget.documentData['Select Qestion']}";

  void phoneAuth() async {
    await auth.setSettings(appVerificationDisabledForTesting: true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.documentData['Phone Number']}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        {
          print("dsd");
          // Get the DocumentReference associated with the document you want to delete
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('uid')
              .doc('${widget.documentData['id']}');

          // Use the delete method to remove the document
          await documentReference.delete();
          print("Data Delected");

          //   // Optionally, you can add a message to indicate that the document was deleted
        }

        //   // Use the delete method to remove the document
        //   await documentReference.delete();
        // Auto-retrieve the SMS code on some devices.
        // Sign in with the credential (credential) when SMS code is received.

        _signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle the verification failure (e.g., too many requests, invalid phone number).
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              dataTodelete: widget.documentData['id'],
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle the case where auto-retrieval has timed out.
        print('Auto-retrieval timeout');
      },
    );
  }

  void _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final authResult = await auth.signInWithCredential(credential);
      // User is signed in.
      final user = authResult.user;
      if (user != null) {
        print('User signed in: ${user.uid}');
      } else {
        print('User not signed in.');
      }
    } catch (e) {
      // Handle verification failure (e.g., invalid OTP).
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      backgroudImage(),
      Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 15),

                    // padding: const EdgeInsets.all(10),
                    child: Text(
                      'Bike Un-Park here ',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff03DABB),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF063A34),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${widget.documentData['UserName']}'
                        // "Abdul Shakoor "
                        ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF063A34),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.pedal_bike,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${widget.documentData['Bike Start Number']}' +
                            '-' +
                            '${widget.documentData['Bike Digit Number']}'
                        // "Abdul Shakoor "
                        ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF063A34),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${widget.documentData['Phone Number']}'
                        // "Abdul Shakoor "
                        ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   color: Colors.transparent,
                //   height: 60,
                //   child: Card(
                //     color: Color(0xFF063A34),
                //     elevation: 9,
                //     child: Center(
                //       child: ListTile(
                //         dense: false,
                //         leading: Icon(
                //           Icons.phone,
                //           color: Colors.white,
                //           size: 32,
                //         ),
                //         title: Text(
                //           '${widget.documentData['Phone Number']}'
                //           // "0321-1234567"
                //           ,
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18,
                //               color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //Center Row contents horizontally,

                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color(0xFF063A34),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Color(0xff05CAAD),
                                child: Image.asset(
                                  "assets/bike.png",
                                  width:
                                      24, // Customize the image size as needed
                                  height: 24,
                                )),
                            SizedBox(width: 8),
                            Text(
                              '${widget.documentData['selected Bike']}'

                              // " Honda"
                              ,
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color(0xFF063A34),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Image.asset(
                                  "assets/red.png",
                                  width:
                                      24, // Customize the image size as needed
                                  height: 24,
                                )),
                            SizedBox(width: 15),
                            Text(
                              '${widget.documentData['Selected color']}'
                              // "Red"
                              ,
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 61,
                  width: 321,
                  decoration: BoxDecoration(
                      color: Color(0xff03DABB),
                      borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff03DABB),
                      // background
                    ),
                    onPressed: phoneAuth,
                    // ()  {},
                    // {
                    //   // Get the DocumentReference associated with the document you want to delete
                    //   DocumentReference documentReference = FirebaseFirestore
                    //       .instance
                    //       .collection('uid')
                    //       .doc('${widget.documentData['id']}');

                    //   // Use the delete method to remove the document
                    //   await documentReference.delete();

                    //   // Optionally, you can add a message to indicate that the document was deleted
                    // }

                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => OtpScreen(verificationId, dataTodelete:
                    //               widget.documentData['Select Qestion'],)));

                    child: Text(
                      'Un-Park Now',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                    onPressed:
                        // phoneAuth,
                        () async {
                      // {
                      //   // Get the DocumentReference associated with the document you want to delete
                      //   DocumentReference documentReference = FirebaseFirestore
                      //       .instance
                      //       .collection('uid')
                      //       .doc('${widget.documentData['id']}');

                      //   // Use the delete method to remove the document
                      //   await documentReference.delete();

                      //   // Optionally, you can add a message to indicate that the document was deleted
                      // }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecurityQuestionsScreen(
                                dataToPass:
                                    widget.documentData['Select Qestion'],
                              )));
                    },
                    child: Text(
                      'Bike Recovery ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //  Center(
        //   child: Column(
        //     children: [
        //       Text('Field 1: ${documentData['Bike Digit Number']}'),
        //       Text('Field 2: ${documentData['sender']}'),
        //       // Add more Text widgets for other fields
        //     ],
        //   ),
        // ),
      ),
    ]);
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
