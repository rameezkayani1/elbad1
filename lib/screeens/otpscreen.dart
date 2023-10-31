import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  var documentData;
  
  OtpScreen(
    this.verificationId,
   
  );

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    print("Data Delected");
    _signInWithCredential(credential);
  }

  void _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final authResult = await _auth.signInWithCredential(credential);
      // User is signed in.
      final user = authResult.user;
      if (user != null) {
        // // DocumentReference documentReference = FirebaseFirestore.instance
        // //     .collection('uid')
        // //     .doc('${widget.documentData['id']}');

        // // Use the delete method to remove the document
        // await documentReference.delete();
        print("pass");
        print('User signed in: ${user.uid}');
      } else {
        print("failllllllllllllllllllllll");
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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bike Park here',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF03DAA1),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: OTPTextField(
                  keyboardType: TextInputType.number,

                  otpFieldStyle:
                      OtpFieldStyle(backgroundColor: Color(0xFF063A34)),
                  // controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  // fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                    print("Changed: " + value);
                  },
                ),
              ),
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   onChanged: (value) {
              //     setState(() {
              //       otp = value;
              //     });
              //   },
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
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



// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';

// import '../widgets/menupage.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       backgroudImage(),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Bike Park here',
//               style: TextStyle(
//                 fontSize: 21,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF03DAA1),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Center(
//               child: OTPTextField(
//                   otpFieldStyle:
//                       OtpFieldStyle(backgroundColor: Color(0xFF063A34)),
//                   // controller: otpController,
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldWidth: 45,
//                   // fieldStyle: FieldStyle.box,
//                   outlineBorderRadius: 15,
//                   style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.white,
//                   ),
//                   onChanged: (pin) {
//                     print("Changed: " + pin);
//                   },
//                   onCompleted: (pin) {
//                     print("Completed: " + pin);
//                   }),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             AnimatedButton(
//               text: 'OTP Verify',
//               color: Colors.cyan,
//               pressEvent: () {
//                 AwesomeDialog(
//                   context: context,
//                   headerAnimationLoop: false,
//                   dialogType: DialogType.success,
//                   // title: 'No Header',
//                   desc:
//                       'Your Bike Has been Un-Parked Successfully from Second Row.against digital Token No : DI-0001. ',
//                   btnOkOnPress: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => menuPage()),
//                     );
//                   },
//                   btnOkIcon: Icons.check_circle,
//                 ).show();
//               },
//             )
//           ],
//         ),
//       ),
//     ]);
//   }

//  
// }
