import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'commons/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onCollapsedBar = false;
  int checkPosition = 0;

  double minWidth = 63.0;
  double maxWidth = 160.0;
  double positionX = 63.0;

  double heigthAppBar = 115;
  @override
  Widget build(BuildContext context) {
    final double paddingTopBar = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: bgColor, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heigthAppBar),
        child: AppBar(
          primary: false,
          centerTitle: true,
          flexibleSpace: Container(
              alignment: Alignment.center,
              color: bgColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: heigthAppBar / 2 + paddingTopBar / 2,
                    child: searchBarAppBar(),
                  ),
                  Container(
                    height: heigthAppBar / 2 + paddingTopBar / 2,
                    child: dataBarAppBar(),
                  )
                ],
              )),
        ),
      ),
      body: GestureDetector(
          onTap: () {
            setState(() {
              if (checkPosition == 1 && onCollapsedBar == true) {
                positionX = minWidth;
                onCollapsedBar = false;
              } else if (checkPosition == 1 && onCollapsedBar == false) {
                positionX = maxWidth;
                onCollapsedBar = true;
              } else {
                positionX = minWidth;
                onCollapsedBar = false;
              }
            });
          },
          onPanUpdate: (detail) {
            setState(() {
              positionX = detail.globalPosition.dx.toDouble();
              if (positionX >= maxWidth) {
                onCollapsedBar = true;
                checkPosition = 1;
              } else if (positionX <= minWidth) {
                checkPosition = 1;
                onCollapsedBar = false;
              } else {
                checkPosition = 0;
                onCollapsedBar = false;
              }
            });
          },
          child: ConstrainedBox(
            constraints: new BoxConstraints(
              minWidth: minWidth,
              maxWidth: maxWidth,
            ),
            child: Container(
              width: positionX,
              height: MediaQuery.of(context).size.height,
              color: (onCollapsedBar ? bgColor : bgColor.withOpacity(0.85)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    iconsSideBar(Icons.person),
                    iconsSideBar(Icons.person),
                    iconsSideBar(CupertinoIcons.clock),
                    iconsSideBar(CupertinoIcons.settings),
                    iconsSideBar(Icons.developer_mode),
                    iconsSideBar(Icons.security),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget iconsSideBar(iconReceived) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,top: 30.0, bottom: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              iconReceived,
              color: mainColor,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Widget dataBarAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("3 ",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w900)),
              Text("Motos por perto",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300)),
            ],
          ),
          Text("TEXT 2", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget searchBarAppBar() {
    return Container(
      transform: Matrix4.translationValues(0.0, 19.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 63.0, right: 63.0),
                  child: TextField(
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFFFFF))),
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: "Localização Atual",
                      hintStyle: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
