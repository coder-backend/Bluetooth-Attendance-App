import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Subject_code.dart';
import './subject_tile.dart';



class BrewList extends StatefulWidget {
  final String uid;
  BrewList({this.uid});
  @override
  _BrewListState createState() => _BrewListState(uid:uid);
}

class _BrewListState extends State<BrewList> {
  final String uid;
  _BrewListState({this.uid});
  @override
  Widget build(BuildContext context) {
 
    final subject_code=Provider.of<List<Subject_Code>>(context)?? [];
    return ListView.builder(
         itemCount: subject_code.length,
         itemBuilder: (context, index){
           return NewFile(uid:uid);
         },
     
       
    );
  }
   
}

