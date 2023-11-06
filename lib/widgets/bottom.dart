import 'package:elbad/screeens/parknow.dart';
import 'package:elbad/screeens/slotlist.dart';
import 'package:flutter/material.dart';

import '../screeens/pageview.dart';
import '../screeens/showparking.dart';

class Bottom extends StatefulWidget {
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var Colorsd = Color(0xff03DAA1);
  int _currentIndex = 0;
  List<Widget> body = [
    RecordListView(),
    ParkNow(),
    DocumentListPage(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    print("hello word");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("hello 2");
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.black,
        unselectedItemColor: Color(0xFFFFFFFF),
        selectedItemColor: Colorsd,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_parking,
            ),
            label: 'Park Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_parking_sharp,
            ),
            label: 'Un Park',
          ),
        ],
        // onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
