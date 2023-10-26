import 'package:flutter/material.dart';

class ColorDrop extends StatefulWidget {
  const ColorDrop({super.key});

  @override
  State<ColorDrop> createState() => _ColorDropState();
}

class _ColorDropState extends State<ColorDrop> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width * 0.40,
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
                backgroundColor: Colors.red,
                child: Image.asset(
                  "assets/red.png",
                  width: 20, // Customize the image size as needed
                  height: 20,
                )),
            SizedBox(width: 8),
            Text(
              "Select color",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        dropdownColor: Color(0xFF063A34),
        value: _selectedItem1,
        onChanged: (newValue) {
          setState(() {
            _selectedItem1 = newValue!;
          });
        },
        items: _dropdownItems1.map<DropdownMenuItem<String>>((item) {
          return DropdownMenuItem<String>(
            value: item['value'],
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: item['color'],
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

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2.4,
//       height: 48,
//       // padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32),
//         color: Color(0xFF063A34),
//       ),
//       child: DropdownButton<String>(
//         underline: Container(
//           color: Colors.transparent,
//         ),
//         dropdownColor: Color(0xFF063A34),
//         value: _selectedItem,
//         hint: Row(
//           children: [
//             CircleAvatar(
//                 backgroundColor: Colors.red,
//                 child: Image.asset(
//                   "assets/red.png",

//                   width: 24, // Customize the image size as needed
//                   height: 24,
//                 )),
//             SizedBox(width: 8),
//             Text(
//               "slect color",
//               style: TextStyle(color: Colors.white54, fontSize: 16),
//             ),
//           ],
//         ),
//         onChanged: (newValue) {
//           setState(() {
//             _selectedItem = newValue!;
//           });
//         },
//         items: _dropdownItems.map<DropdownMenuItem<String>>((item) {
//           return DropdownMenuItem<String>(
//             value: item['value'],
//             child: Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Colors.red,
//                   child: Image.asset(
//                     item['imagePath'],
//                     width: 24, // Customize the image size as needed
//                     height: 24,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Text(
//                   item['label'],
//                   style: TextStyle(
//                       color: Color(0xFFFFFFFF),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16),
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
