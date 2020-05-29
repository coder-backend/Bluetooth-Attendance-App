import 'package:bluetooth_app/subject_Screen/bluetooth2.dart';
import 'package:flutter/material.dart';
import '../Teacher_bluetooth/t_bluetooth2.dart';

class TSubjectTwo extends StatelessWidget {
  static const troutesubject2 = '/tsubject-Two';

@override

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final name = routeArgs['Name'];
  
    final int attendance = routeArgs['Attendance'];
    final subject = routeArgs['Subject'];
    final uid=routeArgs['uid'];
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(TBluetoothApp2.troutebluetooth2, arguments: {
                    'Attendance':attendance,
                    'uid':uid
                  });
            },
            icon: Icon(Icons.bluetooth),
            label: Text(''),
          ),
        ],
      ),
      body: Container(

          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/picture.jpeg'),
          fit:BoxFit.cover,
          ),
          ),
        child: Align(
          alignment: Alignment.bottomCenter,
         // heightFactor: 5,
                  child: Padding(padding: EdgeInsets.all(20),

                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/coffee.jpg'),
                            ),
                            title: Text('Total Class'),
                            subtitle: Text((attendance).toString()),
                          ),
                        ),

          ),
        ),
      )
    );
  }
}