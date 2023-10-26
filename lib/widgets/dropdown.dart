import 'package:flutter/material.dart';

class ImageDropdown extends StatefulWidget {
  @override
  _ImageDropdownState createState() => _ImageDropdownState();
}

class _ImageDropdownState extends State<ImageDropdown> {
  String? selectedItem;

  List<Map<String, dynamic>> _dropdownItems = [
    {'value': 'item1', 'label': 'Honda 125', 'imagePath': 'assets/bike.png'},
    {'value': 'item2', 'label': 'CD70', 'imagePath': 'assets/cd70.png'},
    // Add more items with values and image paths
  ];

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // Function to save the selected value to Firebase
//   void saveDropdownSelection() {
//     _firestore.collection('dropdownSelections').add({
//       'selectedValue': selectedItem,
//       'timestamp': FieldValue
//           .serverTimestamp(), // To record the timestamp of the selection
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width * 0.45,
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xFF063A34),
      ),
      child: DropdownButton<String>(
        underline: Container(
          color: Colors.transparent,
        ),
        hint: Row(
          children: [
            CircleAvatar(
                backgroundColor: Color(0xff05CAAD),
                child: Image.asset(
                  "assets/bike.png",
                  width: 20, // Customize the image size as needed
                  height: 20,
                )),
            SizedBox(width: 8),
            Text(
              "Select Bike",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        dropdownColor: Color(0xFF063A34),
        value: selectedItem,
        onChanged: (newValue) {
          setState(() {
            selectedItem = newValue!;
          });
        },
        items: _dropdownItems.map<DropdownMenuItem<String>>((item) {
          return DropdownMenuItem<String>(
            value: item['value'],
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xff05CAAD),
                  child: Image.asset(
                    item['imagePath'],
                    width: 20, // Customize the image size as needed
                    height: 20,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  item['label'],
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
