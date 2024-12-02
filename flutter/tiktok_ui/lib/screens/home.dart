import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget get topSection => Container(
        height: 100.0,
        padding: EdgeInsets.only(bottom: 15.0),
        color: Colors.yellow[300],
      );

  Widget get videoDescription => Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 10.0,
                  color: Colors.green[300],
                  margin: EdgeInsets.only(top: 10)),
              Container(
                  height: 10.0,
                  color: Colors.green[300],
                  margin: EdgeInsets.only(top: 10)),
              Container(
                  height: 10.0,
                  color: Colors.green[300],
                  margin: EdgeInsets.only(top: 10))
            ]),
      );

  Widget get actionsToolbar => Container(
        width: 100.0,
        color: Colors.red[300],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(
              5,
              (index) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue[300],
                  margin: EdgeInsets.only(top: 20.0))),
        ),
      );
  Widget get middleSection => Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[videoDescription, actionsToolbar]));

  Widget get bottomSection => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            5,
            (index) => Container(
                width: 40.0, height: 40.0, color: Colors.purple[300])),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Top section
          topSection,
          //middle
          middleSection,
          //bottom
          bottomSection
        ],
      ),
    );
  }
}

/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.black26,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 0,

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                //color: Colors.black,
                child: const Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tab options
                      Text(
                        "Explore",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(
                        width: 20,
                      ),

                      Text(
                        "Following",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "For You",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.circle, color: Colors.red, size: 6),
                        ],
                      ),
                      //Spacer(),
                      Positioned(
                        child: Icon(Icons.search, color: Colors.white),
                        left: 0,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
*/