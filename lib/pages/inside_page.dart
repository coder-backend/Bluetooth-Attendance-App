//import 'dart:html';



import 'package:bluetooth_app/pages/brew_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main.dart';
//import './Bluetooth/bluetooth.dart';
import '../pages/drawer.dart';
import './database.dart';
import 'package:provider/provider.dart';

import './Subject_code.dart';
import './setting.dart';

import './subject_tile.dart';

class InsidePage extends StatefulWidget {
  static const routeName = '/inside-page';

  @override
  _InsidePageState createState() => _InsidePageState();
}

class _InsidePageState extends State<InsidePage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final email = routeArgs['email'];
    final password = routeArgs['password'];
    final String uid = routeArgs['uid'];
    return StreamProvider<List<Subject_Code>>.value(
      value: DatabaseService().subject_code,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Student'),
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.power_settings_new),
                label: Text('SignOut'))
          ],
        ),
        drawer: MainDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/photo-1530878955558-a6c31b9c97db.jpg'),
           fit:BoxFit.cover,
           ),
          ),
          
          
        child: NewFile(uid:uid),
        //PostList(uid:uid),//BrewList(uid:uid),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_applications),
        onPressed: () => _updateInfo(context,uid),
      ),
      ),
    );
  }
  void _updateInfo(context,uid)
  {
    showModalBottomSheet(context: context, builder: (context){
      return SingleChildScrollView(
              child: Container(
              height: 1000,
          padding: EdgeInsets.symmetric(vertical:20.0,horizontal:60.0),
          child:SettingForm(uid: uid),
        ),
      );
    });
  }

   
}
