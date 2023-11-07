// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseDateFilter extends StatefulWidget {
//   @override
//   _FirebaseDateFilterState createState() => _FirebaseDateFilterState();
// }

// class _FirebaseDateFilterState extends State<FirebaseDateFilter> {
//   final  _firestore = FirebaseFirestore.instance;
    


//   DateTime? startDate;
//   DateTime? endDate;

//   @override
//   void initState() {
//     super.initState();
//     // Set your desired start and end dates here
//     startDate = DateTime(2023, 1, 1);
//     endDate = DateTime(2023, 12, 31);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Date Filter Example'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore
//             .collection('uid') // Replace with your collection name
//             .where('created', isGreaterThanOrEqualTo: startDate)
//             .where('created', isLessThanOrEqualTo: endDate)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }

//           List<DocumentSnapshot> documents = snapshot.data.docs;

//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               Map<String, dynamic> data = documents[index].data;

//               return ListTile(
//                 title: Text(data['title']), // Replace 'title' with your field name
//                 subtitle: Text(data['created'].toString()), // Replace 'dateField' with your date field name
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
