// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';

// import 'accountRecover.dart';

// class OTPDEMO extends StatefulWidget {
//   const OTPDEMO({super.key});

//   @override
//   State<OTPDEMO> createState() => _OTPDEMOState();
// }

// class _OTPDEMOState extends State<OTPDEMO> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       backgroudImage(),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Bike Park here',
//                 style: TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF03DAA1),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: OTPTextField(
//                   keyboardType: TextInputType.number,

//                   otpFieldStyle:
//                       OtpFieldStyle(backgroundColor: Color(0xFF063A34)),
//                   // controller: otpController,
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldWidth: 45,
//                   // fieldStyle: FieldStyle.box,
//                   outlineBorderRadius: 15,
//                   style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.white,
//                   ),
//                   onChanged: (value) {
//                     setState(() {});
//                     print("Changed: " + value);
//                   },
//                 ),
//               ),
//               // TextFormField(
//               //   keyboardType: TextInputType.number,
//               //   onChanged: (value) {
//               //     setState(() {
//               //       otp = value;
//               //     });
//               //   },
//               // ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SecurityQuestionsScreen()));
//                     // Send a new OTP
//                     // You can implement OTP resend logic here, e.g., by sending a request to your server to generate and send a new OTP.
//                   },
//                   child: Text('Recovery'),
//                 ),
//               ),
//               SizedBox(height: 15),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Verify OTP'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }

//   Widget backgroudImage() {
//     return Container(
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
