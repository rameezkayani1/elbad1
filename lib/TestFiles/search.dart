import 'package:elbad/screeens/unpark.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var card1 = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UnPark()),
        );
      },
      child: Container(
        color: Colors.transparent,
        height: 100,
        child: const Card(
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
                "ISB-5132 ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white54),
              ),
              subtitle: Text(
                "Abdul Shakoor ",
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
    var bar = Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 8,
            child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.black45,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(width: 3, color: Colors.lightGreen),
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
    );
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  bar,
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                        SizedBox(
                          height: 10,
                        ),
                        card1,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget backgroudImage() {
    return
        //  ShaderMask(
        //   shaderCallback: (bounds) => LinearGradient(
        //     colors: [Colors.black, Colors.black12],
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.center,
        //   ).createShader(bounds),
        //   blendMode: BlendMode.darken,
        //   child:
        Container(
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
