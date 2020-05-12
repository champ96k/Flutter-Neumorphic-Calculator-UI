import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var result = "";
  Widget customBox(var text, var textColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print(text);
          setState(() {
            result = "$result" + text;
            print(result);
          });
        },
        child: Container(
          height: 70.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xFFEFEEEE),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ]),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEFEEEE),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomRight,
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: result == null
                            ? Text("")
                            : Text(
                                "$result",
                                style: TextStyle(
                                  fontSize: 52.0,
                                ),
                              ),
                      )
                    ],
                  )
                  //color: Colors.red,
                  ),
            ),
            Container(
              height: 0.75,
              color: Colors.grey.shade50,
            ),
            Flexible(
              flex: 3,
              child: Container(
                //color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        customBox("AC", Colors.grey),
                        customBox("+/-", Colors.grey),
                        customBox("%", Colors.grey),
                        customBox("÷", Colors.orange),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        customBox("7", Colors.black.withOpacity(0.5)),
                        customBox("8", Colors.black.withOpacity(0.5)),
                        customBox("9", Colors.black.withOpacity(0.5)),
                        customBox("x", Colors.orange),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        customBox("4", Colors.black.withOpacity(0.5)),
                        customBox("5", Colors.black.withOpacity(0.5)),
                        customBox("6", Colors.black.withOpacity(0.5)),
                        customBox("-", Colors.orange),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        customBox("1", Colors.black.withOpacity(0.5)),
                        customBox("2", Colors.black.withOpacity(0.5)),
                        customBox("3", Colors.black.withOpacity(0.5)),
                        customBox("+", Colors.orange),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("0");
                            setState(() {
                              result = "$result" + "0";
                              print(result);
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 16.0, right: 16.0),
                              height: 70.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFFEFEEEE),
                                  borderRadius: BorderRadius.circular(32.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      offset: Offset(-6.0, -6.0),
                                      blurRadius: 16.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(6.0, 6.0),
                                      blurRadius: 16.0,
                                    ),
                                  ]),
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 32.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            children: <Widget>[
                              customBox(".", Colors.black.withOpacity(0.5)),
                              customBox("=", Colors.orange),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
