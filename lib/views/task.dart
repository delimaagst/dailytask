import 'package:flutter/material.dart';
import 'package:dailytask/views/insert.dart';
import 'package:dailytask/views/data.dart';

class MyTask extends StatefulWidget {
  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  var savedData = [];

  getSavedData() async {
    var data = await Data.getData();

    setState(() {
      savedData = data;
    });
  }

  @override
  initState() {
    super.initState();

    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My DailyTask'),
          backgroundColor: Color(0xFF75A2EA),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Insert(index: null, value: null))).then((value) {
                  getSavedData();
                });
              },
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView.builder(
              itemCount: savedData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(savedData[index]['taskname']),
                  subtitle: Text(savedData[index]['detail'] +
                      ' ' +
                      savedData[index]['datetime']),
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Insert(
                                index: index,
                                value: savedData[index]))).then((value) {
                      getSavedData();
                    });
                  },
                );
              }),
        ));
  }
}
