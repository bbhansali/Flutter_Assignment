import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext buildcx) {
    return new MaterialApp(
      title: '',
      home: new Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  CalcState createState() => CalcState();
}

class CalcState extends State<Calc> {
  String out = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String op = "";
  String _out = "";
  String text = '';
  Widget build(BuildContext buildcx) {
    return new Scaffold(
        appBar: null,
        backgroundColor: Colors.black,
        body: new Container(
          child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              new Expanded(child: new Divider()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: btn('AC', Color(0xff505050))),
                  Expanded(child: btn('+/-', Color(0xff505050))),
                  Expanded(child: btn('%', Color(0xff505050))),
                  Expanded(child: btn('/', Color(0xffFF9500))),
                ],
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: btn('7', Color(0xffD4D4D2)),
                  ),
                  new Expanded(
                    child: btn('8', Color(0xffD4D4D2)),
                  ),
                  new Expanded(
                    child: btn('9', Color(0xffD4D4D2)),
                  ),
                  new Expanded(
                    child: btn('X', Color(0xffFF9500)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  new Expanded(child: btn('6', Color(0xffD4D4D2))),
                  Expanded(child: btn('5', Color(0xffD4d4d2))),
                  Expanded(child: btn('4', Color(0xffd4d4d2))),
                  Expanded(child: btn('-', Color(0xffFF9500))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: btn('3', Color(0xffD4D4D2))),
                  Expanded(child: btn('2', Color(0xffD4D4D2))),
                  Expanded(child: btn('1', Color(0xffD4D4D2))),
                  Expanded(child: btn('+', Color(0xffFF9500))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(flex: 2, child: btn('0', Color(0xffd4d4d2))),
                  Expanded(child: btn('.', Color(0xffd4d4d2))),
                  Expanded(child: btn('=', Color(0xffFF9500))),
                ],
              ),
            ],
          ),
        ));
  }

  void calculation(btntxt) {
    if (btntxt == 'AC') {
      out = "0";
      num1 = 0.0;
      num2 = 0.0;
      op = "";
      _out = "0";
    } else if (btntxt == '+' ||
        btntxt == 'X' ||
        btntxt == '/' ||
        btntxt == '-' ||
        btntxt == '%') {
      num1 = double.parse(out);
      op = btntxt;
      _out = "";
      op = btntxt;
    } else if (btntxt == '.') {
      if (_out.contains(".")) {
        print("Already contains a dot");
      } else {
        _out = _out + btntxt;
      }
    } else if (btntxt == '=') {
      num2 = double.parse(out);
      if (op == '+') {
        _out = (num1 + num2).toString();
        out = _out;
      }
      if (op == '-') {
        _out = (num1 - num2).toString();
        out = _out;
      }
      if (op == 'X') {
        _out = (num1 * num2).toString();
        out = _out;
      }
      if (op == '/') {
        _out = (num1 / num2).toString();
        out = _out;
      }
      if (op == '%') {
        _out = (num1 / 100 * num2).toString();
        out = _out;
      }
      num1 = double.parse(_out);
      num2 = 0.0;
      _out = "";
    } else if (btntxt == '+/-') {
      _out = (double.parse(_out) * -1).toString();
      out = _out;
    } else {
      _out = _out + btntxt;
      out = _out;
    }
    setState(() {
      if (out.length == 0) {
        text = "0";
      } else {
        text = out;
      }
    });
  }

  Widget btn(text, Color color) {
    return Container(
        child: new MaterialButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
      color: color,
      onPressed: () {
        calculation(text);
      },
      padding: EdgeInsets.all(20.0),
    ));
  }

  Widget btnzero(text, Color color) {
    return Container(
        child: new RaisedButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
      color: color,
      onPressed: () {},
      padding:
          EdgeInsets.only(top: 20.0, bottom: 20.0, right: 85.0, left: 85.0),
    ));
  }
}
