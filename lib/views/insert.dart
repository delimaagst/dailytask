import 'package:flutter/material.dart';
import 'package:dailytask/views/data.dart';

class Insert extends StatefulWidget {
  final index;
  final value;
  Insert({Key key, @required this.index, @required this.value})
      : super(key: key);

  @override
  _InsertState createState() => _InsertState(index: index, value: value);
}

class _InsertState extends State<Insert> {
  _InsertState({@required this.index, @required this.value}) : super();

  final index;
  final value;

  final tasknameController = TextEditingController();
  final detailController = TextEditingController();
  final datetimeController = TextEditingController();

  isDataValid() {
    if (tasknameController.text.isEmpty) {
      return false;
    }

    if (detailController.text.isEmpty) {
      return false;
    }

    if (datetimeController.text.isEmpty) {
      return false;
    }

    return true;
  }

  getData() {
    if (index != null && value != null) {
      setState(() {
        tasknameController.text = value['taskname'];
        detailController.text = value['detail'];
        datetimeController.text = value['datetime'];
      });
    }
  }

  saveData() async {
    if (isDataValid()) {
      var customer = {
        'taskname': tasknameController.text,
        'detail': detailController.text,
        'datetime': datetimeController.text
      };

      var savedData = await Data.getData();

      if (index == null) {
        savedData.insert(0, customer);
      } else {
        savedData[index] = customer;
      }

      await Data.saveData(savedData);
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Empty Field'),
              content: Text('Please fill all field.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                )
              ],
            );
          });
    }
  }

  deleteData() async {
    var savedData = await Data.getData();
    savedData.removeAt(index);

    await Data.saveData(savedData);

    Navigator.pop(context);
  }

  getDeleteButton() {
    if (index != null && value != null) {
      return FlatButton(
        child: Text(
          'DELETE',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          deleteData();
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Insert Task'),
          backgroundColor: Color(0xFF75A2EA),
          actions: <Widget>[
            getDeleteButton(),
            FlatButton(
              onPressed: () {
                saveData();
              },
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Container(
            height: 500.0,
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Center(
                    child: Column(children: <Widget>[
              TextField(
                controller: tasknameController,
                style: TextStyle(fontSize: 17.0, color: Color(0xFF75A2EA)),
                decoration: InputDecoration(
                    icon: Icon(Icons.book), labelText: ' Task Name'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Divider(),
              TextField(
                controller: detailController,
                style: TextStyle(fontSize: 17.0, color: Color(0xFF75A2EA)),
                decoration: InputDecoration(
                    icon: Icon(Icons.list), labelText: 'Detail'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Divider(),
              TextField(
                controller: datetimeController,
                style: TextStyle(fontSize: 17.0, color: Color(0xFF75A2EA)),
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Date and Time'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Divider(),
            ])))));
  }
}
