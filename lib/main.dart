import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Demo_ios()));
}

class Demo_ios extends StatefulWidget {
  const Demo_ios({super.key});

  @override
  State<Demo_ios> createState() => _Demo_iosState();
}

class _Demo_iosState extends State<Demo_ios> {
  bool temp = true;
  bool temp1 = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            color: Colors.grey[700],
            height:458.6666666666667-83,
            width: double.infinity,
            child: Text(
              "$display\n$ans",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          Container(
            height: 458.6666666666667-65,
            width: double.infinity,
            color: Colors.grey[900],
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      fun("AC", Colors.grey[800]),
                      fun("CE", Colors.grey[800]),
                      fun("%", Colors.grey[800]),
                      fun("/", Colors.orangeAccent[200]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      fun("7", Colors.grey[800]),
                      fun("8", Colors.grey[800]),
                      fun("9", Colors.grey[800]),
                      fun("*", Colors.orangeAccent[200]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      fun("4", Colors.grey[800]),
                      fun("5", Colors.grey[800]),
                      fun("6", Colors.grey[800]),
                      fun("-", Colors.orangeAccent[200]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      fun("1", Colors.grey[800]),
                      fun("2", Colors.grey[800]),
                      fun("3", Colors.grey[800]),
                      fun("+", Colors.grey[300]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      fun("00", Colors.grey[800]),
                      fun("0", Colors.grey[800]),
                      fun(".", Colors.grey[800]),
                      fun("=", Colors.orange[400]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fun(dynamic c, Color? col) {
    return Expanded(
        child: InkWell(
      highlightColor: Colors.tealAccent,
      focusColor: Colors.tealAccent,
      hoverColor: Colors.teal,
      splashColor: Colors.teal,
      onTap: () => get("$c"),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        child: Text(
          "$c",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        color: col,
      ),
    ));
  }

  get(dynamic c1) {
    if (c1 != "=") {
      display += c1;
    }
    print("${c1}");
    if (c1 == "CE") {
      ans = "";
      display = "";
    } else if (c1 == "AC") {
      if (ans.isNotEmpty) {
        ans = ans.substring(0, ans.length - 1);
      }
    } else if (c1 == ".") {
      if (!ans.contains(".")) {
        ans = ans + c1;
      }
    } else if (c1 == "+") {
      finalans = ans;
      ans.endsWith("+");
      ans = '';
      temp = true;
      c = 1;
    } else if (c1 == "%") {
      finalans = ans;
      ans = '';
      temp = true;
      c = 2;
    } else if (c1 == "/") {
      finalans = ans;
      ans = '';
      temp = true;
      c = 3;
    } else if (c1 == "-") {
      finalans = ans;
      ans = '';
      temp = true;
      c = 5;
    } else if (c1 == "*") {
      finalans = ans;
      ans = '';
      temp = true;
      temp1 = true;
      c = 4;
    } else if (c1 == "=") {
      if (temp == true) {
        if (c1 != null) {
          if (c == 1) {
            double sum = double.parse(finalans) + double.parse(ans);
            print(sum);
            // temp=true;
            ans = sum.toString();

            ans=finalans;
          } else if (c == 2) {
            double sum = double.parse(finalans) / 100 * double.parse(ans);
            print(sum);
            // temp=true;
            ans = sum.toString();
          } else if (c == 3) {
            double sum = double.parse(finalans) / double.parse(ans);
            print(sum);
            //temp=true;
            ans = sum.toString();
          } else if (c == 4) {
            double sum = double.parse(finalans) * double.parse(ans);
            print(sum);
            //temp=true;
            ans = sum.toString();
          } else if (c == 5) {
            double sum = double.parse(finalans) - double.parse(ans);
            print(sum);

            ans = sum.toString();
          }
        }
        temp = false;
        temp1 = false;
      }
    } else {
      ans = ans + c1;
    }
    setState(() {});
  }

  String ans = "";
  String display = "";
  dynamic finalans = "";

  // String display = "";
  int c = 0;
  int cnt = 0;
  int b = 0;
  int a = 0;
}
