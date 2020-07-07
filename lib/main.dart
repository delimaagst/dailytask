import 'package:flutter/material.dart';
import 'package:dailytask/views/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Daily Task",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final primaryColor = const Color(0xFF75A2EA);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            width: _width,
            height: _height,
            color: primaryColor,
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      SizedBox(height: _height * 0.10),
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 44, color: Colors.white),
                      ),
                      SizedBox(height: _height * 0.10),
                      Image.asset(
                        "assets/task_logo.png",
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: _height * 0.15),
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyTask();
                          }));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      )
                    ])))));
  }
}
