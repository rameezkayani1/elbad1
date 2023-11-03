import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../TestFiles/pageview.dart';
import '../widgets/menupage.dart';

class ParkNow extends StatefulWidget {
  const ParkNow({super.key});

  @override
  State<ParkNow> createState() => _ParkNowState();
}

class _ParkNowState extends State<ParkNow> {
  // void showalert() {
  //   QuickAlert.show(
  //       context: context,
  //       type: QuickAlertType.success,
  //       title: '',
  //       animType: QuickAlertAnimType.rotate,
  //       headerBackgroundColor: Color(0xff063A34),
  //       backgroundColor: Colors.white,
  //       confirmBtnColor: Color(0xff063A34),
  //       text:
  //           'Your Bike Has been Parked Successfully in 02 Row. against digital Token No : DI-0001.\n Thank You !!',
  //       onConfirmBtnTap: () {
  //         // Navigator.of(context)
  //         //     .push(MaterialPageRoute(builder: (context) => slotScreen()));
  //       });
  // }

  final _fireStore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  final _formKey = GlobalKey<FormState>();
  String? selectedItem;
  String? selectedItem3;
  var formatter = DateFormat('d/M/y').format(DateTime.now());
  List<Map<String, dynamic>> _dropdownItems = [
    {'value': 'item1', 'label': 'Honda 125', 'imagePath': 'assets/bike.png'},
    {'value': 'item2', 'label': 'CD70', 'imagePath': 'assets/cd70.png'},
    // Add more items with values and image paths
  ];

  List<Map<String, dynamic>> dropdownItems3 = [
    {
      'value': 'item1',
      'label': 'Who is your best friend?',
    },
    {
      'value': 'item2',
      'label': 'Who is your Place of Birth?',
    },

    // Add more items with values and image paths
  ];
  String? _selectedItem1;
  var bgcolorred = Colors.red;

  var bgcolor = Colors.white;
  List<Map<String, dynamic>> _dropdownItems1 = [
    {
      'value': 'item1',
      'label': 'red',
      'imagePath': 'assets/red.png',
      'color': Colors.red,
    },
    {
      'value': 'item2',
      'label': 'white',
      'imagePath': 'assets/white.png',
      'color': Colors.white,
    },

    // Add more items with values and image paths
  ];
  bool showTextField = false;

  /// form variable
  late String Name;
  late String bikenumber;
  late String bikedigit;
  late String phone;
  late String secret;
  late TextEditingController NameTextController;
  late TextEditingController bikenumberTextController;
  late TextEditingController bikedigitTextController;
  late TextEditingController phoneTextController;
  late TextEditingController secretTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    NameTextController = TextEditingController();
    bikenumberTextController = TextEditingController();
    bikedigitTextController = TextEditingController();
    phoneTextController = TextEditingController();
    secretTextController = TextEditingController();
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
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // body[_currentIndex],
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 20),

                        // padding: const EdgeInsets.all(10),
                        child: const Padding(
                          padding:
                              EdgeInsets.only(right: 27.0, left: 27, top: 20),
                          child: Text(
                            'Bike Park here',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff03DABB),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      // padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                        controller: NameTextController,
                        onChanged: (value) {
                          Name = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),

                          filled: true, //<-- SEE HERE
                          fillColor: Color(0xFF063A34),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'Owner Full Name',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: TextFormField(
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                                // This regex allows only alphabetic characters and spaces
                              ],
                              // onChanged: (text) {
                              //   if (text.contains(RegExp(r'[0-9]'))) {
                              //     // Check for numbers and show an error if found
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: Text('Numbers are not allowed.'),
                              //       ),
                              //     );
                              //   }
                              // },
                              maxLength: 3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter value';
                                } else if (value.contains(RegExp(r'[0-9]'))) {
                                  return "Numbers are not allowed";
                                }

                                return null;
                              },
                              controller: bikenumberTextController,
                              onChanged: (value) {
                                bikenumber = value;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color(0xFF063A34),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  hintText: "ABC",
                                  hintStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                  contentPadding: EdgeInsets.all(10))),
                        ),
                        Flexible(
                          flex: 8,
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter value';
                                }
                                return null;
                              },
                              controller: bikedigitTextController,
                              onChanged: (value) {
                                bikedigit = value;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color(0xFF063A34),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  hintText: "1234",
                                  hintStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                  contentPadding: EdgeInsets.all(10))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          return null;
                        },
                        controller: phoneTextController,
                        onChanged: (value) {
                          phone = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor: Color(0xFF063A34),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'Contact Number',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //Center Row contents horizontally,

                        children: [
                          Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width * 0.42,
                            // padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xFF063A34),
                            ),
                            child: DropdownButton<String>(
                              // isExpanded: true,
                              // iconSize: 35,
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              hint: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: const Color(0xff05CAAD),
                                      child: Image.asset(
                                        "assets/bike.png",
                                        width:
                                            18, // Customize the image size as needed
                                        height: 18,
                                      )),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Select Bike",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 14),
                                  ),
                                ],
                              ),
                              dropdownColor: const Color(0xFF063A34),
                              value: selectedItem,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedItem = newValue!;
                                });
                              },
                              items: _dropdownItems
                                  .map<DropdownMenuItem<String>>((item) {
                                return DropdownMenuItem<String>(
                                  value: item['label'],
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0xff05CAAD),
                                        child: Image.asset(
                                          item['imagePath'],
                                          width:
                                              18, // Customize the image size as needed
                                          height: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item['label'],
                                        style: const TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // Container(
                          //   child: ImageDropdown(),
                          // ),
                          Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width * 0.45,
                            // padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xFF063A34),
                            ),
                            child: DropdownButton<String>(
                              // isExpanded: true,
                              // iconSize: 35,
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              hint: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Image.asset(
                                        "assets/red.png",
                                        width:
                                            18, // Customize the image size as needed
                                        height: 18,
                                      )),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Select color",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 14),
                                  ),
                                ],
                              ),
                              dropdownColor: const Color(0xFF063A34),
                              value: _selectedItem1,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedItem1 = newValue!;
                                  (value) {
                                    if (value == null) {
                                      return 'Relationship is required';
                                    }
                                  };
                                });
                              },
                              items: _dropdownItems1
                                  .map<DropdownMenuItem<String>>((item) {
                                return DropdownMenuItem<String>(
                                  value: item['label'],
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: item['color'],
                                        child: Image.asset(
                                          item['imagePath'],
                                          width:
                                              20, // Customize the image size as needed
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        item['label'],
                                        style: const TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      // padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: const Color(0xFF063A34),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        hint: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.question_answer,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Recovery Question?",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 18),
                            ),
                          ],
                        ),
                        dropdownColor: const Color(0xFF063A34),
                        value: selectedItem3,
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem3 = newValue;
                            showTextField = newValue !=
                                null; // Show text field if a value is selected

                            print('%%%%%%%%%%%%%%%%%%%%');
                            print("$selectedItem3");

                            print('%%%%%%%%%%%%%%%%%%%%');
                            (value) {
                              if (value == null) {
                                return 'Relationship is required';
                              }
                            };
                          });
                        },
                        items: dropdownItems3
                            .map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item['label'],
                            child: Row(
                              children: <Widget>[
                                // CircleAvatar(
                                //   backgroundColor: item['color'],
                                //   child: Image.asset(
                                //     item['imagePath'],
                                //     width:
                                //         20, // Customize the image size as needed
                                //     height: 20,
                                //   ),
                                // ),
                                const SizedBox(width: 8),
                                Text(
                                  item['label'],
                                  style: const TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Container(
                    //   height: 48,
                    //   width: MediaQuery.of(context).size.width,
                    //   // padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(0),
                    //     color: Color(0xFF063A34),
                    //   ),
                    //   child: DropdownButton<String>(
                    //     iconSize: 40,
                    //     isExpanded: true,
                    //     underline: Container(
                    //       color: Colors.transparent,
                    //     ),
                    //     hint: Row(
                    //       children: [
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Icon(
                    //           Icons.question_answer,
                    //           color: Colors.white,
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           "Recovery Question?",
                    //           style: TextStyle(
                    //               color: Colors.white54, fontSize: 18),
                    //         ),
                    //       ],
                    //     ),
                    //     dropdownColor: Color(0xFF063A34),
                    //     value: selectedItem,
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         selectedItem = newValue!;
                    //       });
                    //     },
                    //     items: _dropdownItems3
                    //         .map<DropdownMenuItem<String>>((item) {
                    //       return DropdownMenuItem<String>(
                    //         value: item['label'],
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: 20,
                    //             ),
                    //             Text(
                    //               item['label'],
                    //               style: TextStyle(
                    //                   color: Color(0xFFFFFFFF),
                    //                   fontWeight: FontWeight.w500,
                    //                   fontSize: 18),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Container(
                    //   child: SecuityQuestion(),
                    // ),
                    Visibility(
                      visible: showTextField,
                      child: Container(
                        alignment: Alignment.topLeft,
                        // padding: const EdgeInsets.only(top: 30),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                          controller: secretTextController,
                          onChanged: (value) {
                            secret = value;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.question_answer,
                              color: Colors.white,
                            ),

                            filled: true, //<-- SEE HERE
                            fillColor: Color(0xFF063A34),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Answer',
                            hintStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 61,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xff03DABB),
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff03DABB),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var userid = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            _fireStore.collection('uid').doc(userid).set({
                              'id': userid,
                              'UserName': NameTextController.text,
                              'Bike Start Number':
                                  bikenumberTextController.text,
                              'Bike Digit Number': bikedigitTextController.text,
                              'Phone Number': phoneTextController.text,
                              'selected Bike': selectedItem,
                              'Selected color': _selectedItem1,
                              'Select Qestion': selectedItem3,
                              'sender': loggedInUser.email,
                              'secret': secretTextController.text,
                              'created': formatter,
                            }).then((value) {
                              print("$dropdownItems3");
                              print("$selectedItem");
                              print("data is added sucfully");
                            });
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
                                  MaterialPageRoute(
                                      builder: (context) => const menuPage()),
                                );
                              },
                              btnOkIcon: Icons.check_circle,
                            ).show();
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
                          }
                        },
                        child: const Text(
                          'Park Now',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Todo_List',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecordListScreen()),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // bottomNavigationBar: Bottom(),

          //   onTap: (index) {
          //     setState(() {});
          //   },
          //   backgroundColor: Colors.black,
          //   unselectedItemColor: Color(0xFFFFFFFF),
          //   selectedItemColor: Color(0xff03DAA1),
          //   items: <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.home,
          //       ),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.local_parking,
          //         color: Colors.white,
          //       ),
          //       label: 'Park Now',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.local_parking_sharp,
          //         color: Color.fromARGB(255, 248, 248, 248),
          //       ),
          //       label: 'Un Park',
          //     ),
          //   ],
          //   // onTap: (selectedIndex) => _changePage(selectedIndex),
          // ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _currentIndex,
          //   onTap: (int newindex) {
          //     setState(() {
          //       _currentIndex = newindex;
          //     });
          //   },
          //   backgroundColor: Colors.black,
          //   unselectedItemColor: Color(0xFFFFFFFF),
          //   selectedItemColor: Color(0xff03DAA1),
          //   items: <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.home,
          //       ),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.local_parking,
          //         color: Colors.white,
          //       ),
          //       label: 'Park Now',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.local_parking_sharp,
          //         color: Color.fromARGB(255, 248, 248, 248),
          //       ),
          //       label: 'Un Park',
          //     ),
          //   ],
          //   // onTap: (selectedIndex) => _changePage(selectedIndex),
          // ),
        ),
      ],
    );
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
}
