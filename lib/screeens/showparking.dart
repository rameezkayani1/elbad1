import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/screeens/showdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'notification.dart';

class DocumentListPage extends StatefulWidget {
  @override
  State<DocumentListPage> createState() => _DocumentListPageState();
}

class _DocumentListPageState extends State<DocumentListPage> {
  DateTime startDate = DateTime(2023, 1, 1);
  DateTime endDate = DateTime(2023, 12, 31);
  var searchName = "";
  var tarih = '';
  late Future<QuerySnapshot> filteredData;

  // var formatter = DateFormat('d/M/y').format(DateTime.now());
//
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      backgroudImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextField(
                            onChanged: (Value) {
                              setState(() {
                                searchName = Value;
                              });
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.black45,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.lightGreen),
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2025),
                                      );

                                      if (pickedDate != null) {
                                        // print("//??/////////");
                                        // print(pickedDate);
                                        // print("//??/////////");

                                        var formattedDate = DateFormat('d/M/y')
                                            .format(pickedDate);
                                        print(formattedDate);

                                        setState(() {
                                          searchName = formattedDate;
                                          print(
                                              "<<<<<<>>>>>>>>>>>>>>,,,,,,,,,,,,...");
                                          print("$filteredData");
                                          print(
                                              "<<<<<<>>>>>>>>>>>>>>,,,,,,,,,,,,...");
                                          print("/////////////////");
                                          print("$tarih");

                                          print("/////////////////");
                                        });
                                      }
                                    },
                                    child: Image.asset("assets/vector.png")),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintText: "Search by bike number",
                                hintStyle: const TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                                contentPadding: const EdgeInsets.all(10))),
                      ),
                      Flexible(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, // Background color
                            ),
                            child: const Icon(
                              Icons.notifications,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const notificationBell(),
                                ),
                              );
                            },
                          )),

                      // notificationBell
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('uid')
                    .orderBy('Bike Start Number')
                    // .where('bitis', isEqualTo: 'tarih')
                    .startAt([searchName]).endAt(
                        [searchName + "\uf8ff"]).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          final document =
                              documents[index].data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DocumentDetailPage(document),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 90,
                              child: Card(
                                color: const Color(0xff063A34),
                                elevation: 9,
                                child: ListTile(
                                    // tileColor: Color(0xff006657),
                                    dense: false,
                                    leading: const Icon(
                                      Icons.pedal_bike,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                    title: Text(
                                      (document['Bike Start Number']) +
                                          "-" +
                                          (document['Bike Digit Number']),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white54),
                                    ),
                                    subtitle: Text(
                                      (document['UserName']),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white54),
                                    ),
                                    trailing: Text(
                                      (document['created']),

                                      // (document['created']),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white54),
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
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
}
