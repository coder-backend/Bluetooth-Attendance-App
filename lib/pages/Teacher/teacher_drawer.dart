
import 'package:flutter/material.dart';

class TeacherMainDrawer extends StatelessWidget {
  @override

  Widget buildListTile(String title, IconData icon,) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: null,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.pinkAccent,
            child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: AssetImage('assets/images/149071.png'),
                    ),
          ),
          SizedBox(height: 20,),
           
          
          buildListTile('Past Record', Icons.fiber_manual_record,),
          buildListTile('Gallery', Icons.photo_album,),
          buildListTile('Registration', Icons.list,),
        
        ],
      ),
    );
  }
}
