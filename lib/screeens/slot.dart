// import 'package:flutter/material.dart';

// import 'parknow.dart';
// import 'search.dart';

// class slotScreen extends StatefulWidget {
//   const slotScreen({super.key});

//   @override
//   State<slotScreen> createState() => _slotScreenState();
// }

// class _slotScreenState extends State<slotScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       backgroudImage(),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           leading: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           title: Text(
//             "Parking slots",
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 "8/17",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//         // body: SingleChildScrollView(
//         //   child: Column(
//         //     children: [
//         //       // Container(
//         //       //   padding: EdgeInsets.only(left: 20, right: 20),
//         //         child: Row(
//         //           children: [

//         //             Container(
//         //              decoration: BoxDecoration(
//         //                 gradient: LinearGradient(
//         //                   colors: [
//         //                     Colors.black,
//         //                     Colors.transparent,
//         //                  ],
//         //                ),
//         //               ),
//         //              alignment: Alignment.center,
//         //              height: 40,
//         //               width: MediaQuery.of(context).size.width / 2.3,
//         //               child: Text(
//         //                 "Row 01",
//         //                 style: TextStyle(color: Colors.white),
//         //              ),
//         //              ),
//         //              Container(
//         //               decoration: BoxDecoration(
//         //                gradient: LinearGradient(
//         //                  colors: [
//         //                     Colors.black,
//         //                     Colors.transparent,
//         //                   ],
//         //                ),
//         //               ),
//         //               alignment: Alignment.center,
//         //               height: 40,
//         //               width: MediaQuery.of(context).size.width / 2.4,
//         //       child: Text(
//         //                 "Row 02",
//         //                style: TextStyle(color: Colors.white),
//         //              ),
//         //            ),
//         //          ],
//         //         ),
//         //       ),
//         //       SizedBox(
//         //         height: 20,
//         //       ),

//               // Container(
//               //   child: GridView.count(
//               //     crossAxisCount: 2,
//               //     children: new List<Widget>.generate(4, (index) {
//               //       return new GridTile(
//               //         child: new Card(
//               //             color: Colors.blue.shade200,
//               //             child: new Center(
//               //               child: new Text('tile $index'),
//               //             )),
//               //       );
//               //     }),
//               //   ),
//               // ),

//               // GestureDetector(
//               //   child: Container(
//               //     child: Row(
//               //       children: [
//               //         Container(
//               //           decoration: BoxDecoration(
//               //             border: Border.all(
//               //               color: Colors.white,
//               //             ),
//               //             gradient: LinearGradient(
//               //               colors: [
//               //                 Colors.black,
//               //                 Colors.transparent,
//               //               ],
//               //             ),
//               //           ),
//               //           alignment: Alignment.center,
//               //           height: 72,
//               //           width: MediaQuery.of(context).size.width / 2,
//               //           child: Text(
//               //             "01",
//               //             style: TextStyle(color: Colors.white),
//               //           ),
//               //         ),
//               //         Container(
//               //           decoration: BoxDecoration(
//               //             border: Border.all(
//               //               color: Colors.white,
//               //             ),
//               //             gradient: LinearGradient(
//               //               colors: [
//               //                 Colors.black,
//               //                 Colors.transparent,
//               //               ],
//               //             ),
//               //           ),
//               //           alignment: Alignment.center,
//               //           height: 72,
//               //           width: MediaQuery.of(context).size.width / 2,
//               //           child: Text(
//               //             "02",
//               //             style: TextStyle(color: Colors.white),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "03",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Image.asset(
//               //           "assets/bike.png",
//               //           height: 53,
//               //           width: 65,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "05",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Image.asset(
//               //           "assets/bike.png",
//               //           height: 53,
//               //           width: 65,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "07",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Image.asset(
//               //           "assets/bike.png",
//               //           height: 53,
//               //           width: 65,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "09",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "10",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "11",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "12",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "13",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Image.asset(
//               //           "assets/bike.png",
//               //           height: 53,
//               //           width: 65,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Container(
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "15",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //       Container(
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             color: Colors.white,
//               //           ),
//               //           gradient: LinearGradient(
//               //             colors: [
//               //               Colors.black,
//               //               Colors.transparent,
//               //             ],
//               //           ),
//               //         ),
//               //         alignment: Alignment.center,
//               //         height: 72,
//               //         width: MediaQuery.of(context).size.width / 2,
//               //         child: Text(
//               //           "16",
//               //           style: TextStyle(color: Colors.white),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }

//   Widget backgroudImage() {
//     return
//         //  ShaderMask(
//         //   shaderCallback: (bounds) => LinearGradient(
//         //     colors: [Colors.black, Colors.black12],
//         //     begin: Alignment.bottomCenter,
//         //     end: Alignment.center,
//         //   ).createShader(bounds),
//         //   blendMode: BlendMode.darken,
//         //   child:
//         Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/BikeMap.jpg'),

//           /// change this to your  image directory
//           fit: BoxFit.cover,
//           // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
//         ),
//       ),
//     );
//   }
// }
