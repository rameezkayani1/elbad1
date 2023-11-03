import 'package:flutter/material.dart';

class notificationBell extends StatefulWidget {
  const notificationBell({super.key});

  @override
  State<notificationBell> createState() => _notificationBellState();
}

class _notificationBellState extends State<notificationBell> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      side: BorderSide(color: Color(0xff03DABB), width: 2),
                      // Background color
                    ),
                    child: Text("Clear/Mark as Read",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    onPressed: () {},
                  ))
            ],
          ),
        )
      ],
    );
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
