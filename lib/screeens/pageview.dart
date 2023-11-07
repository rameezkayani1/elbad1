import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/screeens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecordListView extends StatefulWidget {
  // List<String> records = List.generate(300, (index) => 'Record $index');

  const RecordListView({super.key});

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  final int itemsPerPage = 12;
  int currentPage = 0;
  int totalPageCount = 0;

  List<DocumentSnapshot> records = [];
  @override
  void initState() {
    fetchTotalRecordsCount();
    super.initState();
  }

  Future<void> fetchTotalRecordsCount() async {
    CollectionReference recordsRef =
        FirebaseFirestore.instance.collection('uid');
    QuerySnapshot querySnapshot = await recordsRef.get();
    records = querySnapshot.docs;
    totalPageCount = (records.length / itemsPerPage).ceil();
    setState(() {});
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => loginpage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int start = currentPage * itemsPerPage;
    int end = (currentPage + 1) * itemsPerPage;
    if (end > records.length) {
      end = records.length;
    }
    List<DocumentSnapshot> currentPageRecords = records.sublist(start, end);
    if (records.length < itemsPerPage) {
      totalPageCount = 1; // Set totalPageCount to 0 to indicate an error
    } else if (records.length == itemsPerPage) {}
    // Future<void> fetchTotalRecordsCount() async {
    //   CollectionReference recordsRef =
    //       FirebaseFirestore.instance.collection('uid');
    //   QuerySnapshot querySnapshot = await recordsRef.get();
    //   records = querySnapshot.docs;
    //   totalPageCount = (records.length / itemsPerPage).ceil();
    // }
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance
    //         .collection("uid")
    //         .limit(12)
    //         .orderBy("created", descending: true)
    //         .snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //       if (!snapshot.hasData) {
    //         return CircularProgressIndicator();
    //       }
    //       if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       }

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
                "${currentPage + 1} / $totalPageCount",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [
              //             const Color.fromARGB(137, 158, 112, 112),
              //             Colors.transparent,
              //           ],
              //         ),
              //       ),
              //       alignment: Alignment.center,
              //       height: 40,
              //       width: MediaQuery.of(context).size.width / 2.3,
              //       child: Text(
              //         "Row 01",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [
              //             Colors.black,
              //             Colors.transparent,
              //           ],
              //         ),
              //       ),
              //       alignment: Alignment.center,
              //       height: 40,
              //       width: MediaQuery.of(context).size.width / 2.4,
              //       child: Text(
              //         "Row 02",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 25,
              ),
              if (totalPageCount ==
                  0) // Display an error message if totalPageCount is 0
                Center(
                  child: Text('Error: Not enough records to paginate.'),
                ),
              if (totalPageCount != 0)
                Expanded(
                  child: PageView.builder(
                    // physics: NeverScrollableScrollPhysics(), // Disable scrolling
                    scrollDirection: Axis.horizontal,
                    itemCount: totalPageCount,
                    itemBuilder: (context, page) {
                      return GridView.builder(
                        // physics:
                        //     ClampingScrollPhysics(), // Prevent overscrolling on other pages

                        // physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.8 / 1.2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0,
                        ),
                        itemCount: currentPageRecords.length,

                        itemBuilder: (context, page) {
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
                          // ListTile(
                          //   title: Text(currentPageRecords[index]),
                          // );
                        },
                      );
                    },
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    ]);
    // }
    // );
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
