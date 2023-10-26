import 'package:elbad/screeens/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String phoneNumber = '+92XXXXXXXXXX';
  FirebaseAuth _auth = FirebaseAuth.instance;

  void requestOTP() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+92$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {
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
            builder: (context) => OtpScreen(verificationId),
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
      final authResult = await _auth.signInWithCredential(credential);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter Your Phone Number:'),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestOTP,
              child: Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
