
import 'package:flutter/material.dart';
import '../Teacher_bluetooth/t_bluetooth.dart';
import '../Teacherdata.dart';

class TeacherSubjectOne extends StatefulWidget {
  static const troutesubject1 = '/tsubject-One';

  @override
  _TeacherSubjectOneState createState() => _TeacherSubjectOneState();
}

class _TeacherSubjectOneState extends State<TeacherSubjectOne> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final name = routeArgs['Name'];
 
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
                Navigator.of(context).pushNamed(TBluetoothApp.troutebluetooth,
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
                  title: Text('Total Class'),
                  subtitle: Text((attendance).toString()),
                ),
              ),
            ),
          ),
        ));
  }
}
