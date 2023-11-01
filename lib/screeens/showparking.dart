import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbad/screeens/showdata.dart';
import 'package:flutter/material.dart';

class DocumentListPage extends StatefulWidget {
  @override
  State<DocumentListPage> createState() => _DocumentListPageState();
}

class _DocumentListPageState extends State<DocumentListPage> {
  var searchName = "";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      backgroudImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                color: Colors.black,
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
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('uid')
                    .orderBy('Bike Start Number')
                    .startAt([searchName]).endAt(
                        [searchName + "\uf8ff"]).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
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
                                      (document['Bike Start Number']) +
                                          "-" +
                                          (document['Bike Digit Number']),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white54),
                                    ),
                                    subtitle: Text(
                                      (document['UserName']),
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
