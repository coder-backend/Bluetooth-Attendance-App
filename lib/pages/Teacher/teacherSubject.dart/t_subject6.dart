import '../Teacher_bluetooth/t_bluetooth6.dart';
import 'package:flutter/material.dart';

class TSubjectSix extends StatelessWidget {
  static const troutesubject6 = '/tsubject-Six';

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
                  .pushNamed(TBluetoothApp6.troutebluetooth6, arguments: {
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
          image: DecorationImage(image: AssetImage('assets/images/picture.jpg'),
          fit:BoxFit.cover,
          ),
          ),
        child: Align(
          alignment: Alignment.bottomCenter,
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