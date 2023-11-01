import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecuityQuestion extends StatefulWidget {
  const SecuityQuestion({super.key});

  @override
  State<SecuityQuestion> createState() => _SecuityQuestionState();
}

class _SecuityQuestionState extends State<SecuityQuestion> {
  String? _selectedItem3;

  var bgcolor = Colors.white;
  List<Map<String, dynamic>> _dropdownItems3 = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Color(0xFF063A34),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        iconSize: 30,
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
            Text(
              "Recovery Question?",
              style: TextStyle(color: Colors.white54, fontSize: 18),
            ),
          ],
        ),
        dropdownColor: Color(0xFF063A34),
        value: _selectedItem3,
        onChanged: (newValue) {
          setState(() {
            _selectedItem3 = newValue!;
          });
        },
        items: _dropdownItems3.map<DropdownMenuItem<String>>((item) {
          return DropdownMenuItem<String>(
            value: item['value'],
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  item['label'],
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
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
