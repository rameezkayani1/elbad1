// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'unpark.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 8,
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: Colors.black45,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 3, color: Colors.lightGreen),
                            ),
                            suffixIcon: Image.asset("assets/vector.png"),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: "Search by bike number",
                            hintStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            contentPadding: EdgeInsets.all(10))),
                  ),
                  Flexible(
                      flex: 2,
                      child: Icon(
                        Icons.notifications,
                        size: 32,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              ///
              stream: _fireStore
                  .collection('Users')
                  .orderBy('created', descending: false)
                  .snapshots(),

              ///flutter aysnc snapshot
              builder: (context, snapshot) {
                List<MessageBubble> todoWidgets = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final todoLists = snapshot.data!.docs;

                for (var todoList in todoLists) {
                  final Name = (todoList.data() as dynamic)['UserName'];

                  final bikenumber =
                      (todoList.data() as dynamic)['Phone Number'];

                  final bikedigit =
                      (todoList.data() as dynamic)['Bike Digit Number'];

                  final phone = (todoList.data() as dynamic)['Phone Number'];

                  final loggedIn = (todoList.data() as dynamic)['sender'];

                  final currentUser = loggedInUser.email;
                  print('Current user $currentUser');
                  print("$Name");
                  print("$phone");
                  print('logged user $loggedIn');

                  final messageWidget = MessageBubble(
                    Name: '$Name',
                    isLoggedIn: currentUser == loggedIn,
                    bikenumber: '$bikenumber',
                    bikedigit: '$bikedigit',
                    phone: '$phone',
                  );

                  todoWidgets.add(messageWidget);
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(children: todoWidgets),
                  ),
                );
              },
            ),
          ],
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

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.isLoggedIn,
      required this.Name,
      required this.bikenumber,
      required this.bikedigit,
      required this.phone});
  final String Name;
  final String bikenumber;
  final String phone;
  final String bikedigit;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnPark()),
              );
            },
            child: Container(
              color: Colors.transparent,
              height: 100,
              child: Card(
                color: Color(0xff006657),
                elevation: 9,
                child: ListTile(
                    dense: false,
                    leading: Icon(
                      Icons.pedal_bike,
                      color: Colors.white,
                      size: 32,
                    ),
                    title: Text(
                      "$bikenumber-$bikedigit ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white54),
                    ),
                    subtitle: Text(
                      "$Name ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white54),
                    ),
                    trailing: Text(
                      "09/05/2023",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white54),
                    )),
              ),
            ),
          ),
          // Material(
          //     elevation: 5.0,
          //     borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(30.0),
          //         bottomRight: Radius.circular(30.0),
          //         bottomLeft: Radius.circular(30.0)),
          //     color: Colors.lightBlueAccent,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text('$bikenumber',
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   color: Colors.black,
          //                 )),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text('$bikedigit',
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   color: Colors.black,
          //                 )),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text('$phone',
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   color: Colors.black,
          //                 )),
          //           ),
          //     ],
          //   ),
          // )),
        ],
      ),
    );
  }
}
