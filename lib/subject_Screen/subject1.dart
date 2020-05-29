
import 'package:flutter/material.dart';
import './bluetooth.dart';
import '../pages/Subject_code.dart';

class SubjectOne extends StatefulWidget {
  static const routesubject1 = '/subject-One';

  @override
  _SubjectOneState createState() => _SubjectOneState();
}

class _SubjectOneState extends State<SubjectOne> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final name = routeArgs['Name'];
    final sid = routeArgs['SID'];
    final int attendance = routeArgs['Attendance'];
    final subject = routeArgs['Subject'];
    final uid = routeArgs['uid'];
    return Scaffold(
        appBar: AppBar(
          title: Text(subject),
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(BluetoothApp.routebluetooth,
                    arguments: {'Attendance': attendance, 'uid': uid});
              },
              icon: Icon(Icons.bluetooth),
              label: Text(''),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/image.jpg'),
          fit:BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Align(
             alignment: Alignment.bottomCenter,
             // heightFactor: 7,
                          child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.blueAccent,
                    backgroundImage: AssetImage('assets/images/coffee.jpg'),
                  ),
                  title: Text('Attendance'),
                  subtitle: Text((attendance).toString()),
                ),
              ),
            ),
          ),
        ));
  }
}
