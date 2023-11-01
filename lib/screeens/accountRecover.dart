// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/widgets/menupage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  final String dataToPass;

  SecurityQuestionsScreen({required this.dataToPass});
  @override
  _SecurityQuestionsScreenState createState() =>
      _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late User loggedInUser;

  late String getSecret;
  late TextEditingController getSecretTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();

    getSecretTextController = TextEditingController();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
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
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 70),

                  // padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Bike Un-Park here ',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff03DABB),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   color: Colors.transparent,
                      //   height: 60,
                      //   child: Center(
                      //     child: Card(
                      //       color: Color(0xFF063A34),
                      //       elevation: 9,
                      //       child: ListTile(
                      //         dense: false,
                      //         leading: Icon(
                      //           Icons.person,
                      //           color: Colors.white,
                      //         ),
                      //         title: Text(
                      //           "${widget.dataToPass}"
                      //           // "Abdul Shakoor "
                      //           ,
                      //           style: TextStyle(
                      //               // fontWeight: FontWeight.bold,
                      //               fontSize: 18,
                      //               color: Colors.white),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xFF063A34),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${widget.dataToPass}"
                              // "Abdul Shakoor "
                              ,
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // You can dynamically generate input fields for security questions here.
                      // For simplicity, we'll add two security questions.
                      Container(
                        height: 60,
                        color: Colors.transparent,
                        alignment: Alignment.topLeft,
                        // padding: const EdgeInsets.only(top: 30),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: getSecretTextController,
                          onChanged: (value) {
                            getSecret = value;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),

                            filled: true, //<-- SEE HERE
                            fillColor: Color(0xFF063A34),

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Colors.blue),
                                ),
                            hintText: 'Please share Secret to To recovery Bike',
                            hintStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       _formKey.currentState!.save();
                      //       registerUserWithSecurityQuestions(
                      //           email, password, securityQuestions);
                      //     }
                      //   },
                      //   child: Text('Register'),
                      // ),
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
                            onPressed: () {
                              deleteDocument();
                            },
                            child: Text(
                              'Unpark Bike',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget backgroudImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/BikeMap.jpg'),

          /// change this to your  image directory
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }

  void deleteDocument() {
    final String valueToMatch = getSecret;

    // Replace 'collectionName' with the name of your Firestore collection.
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('uid');

    collectionReference
        .where('secret', isEqualTo: valueToMatch)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          document.reference.delete().then((_) {
            print('Document deleted');
            AwesomeDialog(
              context: context,
              headerAnimationLoop: false,
              dialogType: DialogType.success,
              // title: 'No Header',
              desc:
                  'Your Bike Has been Un-Parked Successfully from Second Row.against digital Token No : DI-0001. ',
              btnOkOnPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menuPage()),
                );
              },
              btnOkIcon: Icons.check_circle,
            ).show();
          }).catchError((error) {
            print('Error deleting document: $error');
          });
        }
      } else {
        AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.error,
          // title: 'No Header',
          desc: 'Something Wrong',
          btnOkOnPress: () {
            debugPrint('Error');
          },
          btnOkIcon: Icons.check_circle,
        ).show();
        print('No matching documents found');
      }
    }).catchError((error) {
      print('Error querying Firestore: $error');
    });
  }
  // Future<void> registerUserWithSecurityQuestions(String email, String password,
  //     List<Map<String, String>> securityQuestions) async {
  //   try {
  //     final UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     final User? user = userCredential.user;

  //     if (user != null) {
  //       await _databaseRef
  //           .child('users/${user.uid}/securityQuestions')
  //           .set(securityQuestions);
  //       print('User registered with security questions');
  //     }
  //   } catch (e) {
  //     print('Error during registration: $e');
  //   }
  // }

  // Future<void> signInWithSecurityQuestions() async {
  //   try {
  //     final User? user = _auth.currentUser;

  //     if (user != null) {
  //       final DataSnapshot snapshot = (await _databaseRef
  //           .child('users/${user.uid}/securityQuestions')
  //           .once()) as DataSnapshot;

  //       // final Map<String, dynamic> securityQuestions = Map<String, dynamic>.from(snapshot.value);

  //       if (getSecret.isNotEmpty) {
  //         // Check if the answers match provided security questions.
  //         // You can implement this logic.
  //         // For simplicity, let's assume they match.
  //         print('User signed in with security questions');
  //       }
  //     }
  //   } catch (e) {
  //     print('Error during sign-in: $e');
  //   }
  // }
}
