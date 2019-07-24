import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'commons/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool realValue = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: bgColor, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));

    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/img/taxi.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            // Color(0xff141414)

            backgroundColor: Color(0xff141414).withOpacity(0.92),
            body: Container(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height) / 2 - 20,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0.0, 11.0, 0.0),
                          child: Icon(
                            Icons.location_on,
                            size: 50.0,
                            color: mainColor,
                          ),
                        ),
                        Text(
                          "Motoqueiros",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 28.0,
                              color: Color(0xffFFFFFF)),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0.0, -14.0, 0.0),
                          child: Text(
                            "Fantasmas",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0,
                                color: mainColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(55.0, 0.0, 55.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        returnMainTextField(false, "Login"),
                        Divider(
                          color: Colors.transparent,
                          height: 35.0,
                        ),
                        returnMainTextField(true, "Password"),
                      ],
                    ),
                  )),
                  GestureDetector(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 35.0, right: 35.0, top: 70.0),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: bgColor,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {});
                    },
                    onForcePressStart: (detail) {
                      print("start | $detail");
                    },
                    onLongPress: () {
                      print("segurou pkas");
                    },
                  ),
                 
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 35.0),
                    child: GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context)
                                .copyWith(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                                checkColor: bgColor,
                                activeColor: mainColor,
                                onChanged: (value) {
                                  setState(() {
                                    realValue = !realValue;
                                  });
                                },
                                value: realValue),
                          ),
                          Text(
                            "Lembrar senha",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          realValue = !realValue;
                        });
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 35.0, right: 35.0, top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                "Criar conta",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w200),
                              ),
                              onTap: () {},
                            ),
                            GestureDetector(
                              child: Text(
                                "Recuperar senha",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w200),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )))
      ],
    );
  }

  Widget returnMainTextField(bool obscuredText, String textInput) {
    return TextField(
      obscureText: obscuredText,
      style: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 15.0,
          fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFFFFFF))),
        labelStyle: TextStyle(color: Colors.blue),
        hintText: textInput,
        hintStyle: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 15.0,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
