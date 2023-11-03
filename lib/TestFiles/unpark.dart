import 'package:flutter/material.dart';

class UnPark extends StatefulWidget {
  const UnPark({super.key});

  @override
  State<UnPark> createState() => _UnParkState();
}

class _UnParkState extends State<UnPark> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 70),

                      // padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Bike Un-Park here ',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF03DAA1),
                        ),
                      )),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    child: const Card(
                      color: Color(0xFF063A34),
                      elevation: 9,
                      child: ListTile(
                        dense: false,
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 32,
                        ),
                        title: Text(
                          "Abdul Shakoor ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    child: const Card(
                      color: Color(0xFF063A34),
                      elevation: 9,
                      child: ListTile(
                        dense: false,
                        leading: Icon(
                          Icons.pedal_bike,
                          color: Colors.white,
                          size: 32,
                        ),
                        title: Text(
                          "SGM - 5132",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    child: const Card(
                      color: Color(0xFF063A34),
                      elevation: 9,
                      child: ListTile(
                        dense: false,
                        leading: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 32,
                        ),
                        title: Text(
                          "0321-1234567",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //Center Row contents horizontally,

                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Color(0xFF063A34),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xff05CAAD),
                                  child: Image.asset(
                                    "assets/bike.png",
                                    width:
                                        24, // Customize the image size as needed
                                    height: 24,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                " Honda",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Color(0xFF063A34),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Image.asset(
                                    "assets/red.png",
                                    width:
                                        24, // Customize the image size as needed
                                    height: 24,
                                  )),
                              SizedBox(width: 15),
                              Text(
                                "Red",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 61,
                    width: 321,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(97, 177, 90, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromRGBO(97, 177, 90, 1), // background
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => OtpScreen()
                        //     )
                        //     );
                      },
                      child: Text(
                        'Un-Park Now',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: Bottom(),
        ),
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
