import 'package:bluetooth_app/pages/database.dart';
import 'package:flutter/material.dart';
import './userData.dart';
import './database.dart';
import '../subject_Screen/subject1.dart';
import '../subject_Screen/subject2.dart';
import '../subject_Screen/subject3.dart';
import '../subject_Screen/subject4.dart';
import '../subject_Screen/subject5.dart';
import '../subject_Screen/subject6.dart';
import '../subject_Screen./subject7.dart';
import './Subject_code.dart';
import './Bluetooth/images.dart';
class NewFile extends StatefulWidget {
  final String uid;

  NewFile({this.uid});
  @override
  _NewFileState createState() => _NewFileState(uid: uid);
}

class _NewFileState extends State<NewFile> {
  final String uid;
  _NewFileState({this.uid});

  final _formKey = GlobalKey<FormState>();
  final List<int> semester = [1, 2, 3, 4, 5, 6, 7, 8];
  int _currentSemester;
  String _currentName;
  String _currentSID;
  String _currentSubject1;
  String _currentSubject2;
  String _currentSubject3;
  String _currentSubject4;
  String _currentSubject5;
  String _currentSubject6;
  String _currentSubject7;








  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return SingleChildScrollView(
                      child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(top:8.0),
                            child: Column(
                  children: <Widget>[
                    Imagesinput(),
                      Text(
                        '${userData.name}(${userData.sid})',
                        //style: TextStyle(
                        //  fontSize: 25,
                        //fontWeight: FontWeight.bold,
                        //fontStyle: FontStyle.italic,
                        //color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                     
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 2,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject1}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject1(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject2}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject2(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject3}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject3(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject4}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject4(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject5}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject5(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject6}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject6(context, userData),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1,
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage:
                                  AssetImage('assets/images/gettyimages-157482029-612x612.jpg'),
                            ),
                            title: FlatButton(
                              child: Text('${userData.subject7}'),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => subject7(context, userData),
                            ),
                          ),
                        ),
                      ),
                   
                    FlatButton(
                      child: Text(""),
                      color: Color(0xFF4B9DFE),
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed:null,
                      
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(child: Text('you got an error'));
        }
      },
    );
  }


 void subject1(context, userData) {
    Navigator.of(context).pushNamed(SubjectOne.routesubject1, arguments: {
      'Name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance1,
      'Subject': userData.subject1,
      'uid': userData.uid,
    });
  }

  void subject2(context, userData) {
    Navigator.of(context).pushNamed(SubjectTwo.routesubject2, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance2,
      'Subject': userData.subject2,
      'uid': userData.uid,
    });
  }

  void subject3(context, userData) {
    Navigator.of(context).pushNamed(SubjectThree.routesubject3, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance3,
      'Subject': userData.subject3,
      'uid': userData.uid,
    });
  }

  void subject4(context, userData) {
    Navigator.of(context).pushNamed(SubjectFour.routesubject4, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance4,
      'Subject':userData.subject4,
      'uid': userData.uid,
    });
  }

  void subject5(context, userData) {
    Navigator.of(context).pushNamed(SubjectFive.routesubject5, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance5,
      'Subject': userData.subject5,
      'uid': userData.uid,
    });
  }

  void subject6(context, userData) {
    Navigator.of(context).pushNamed(SubjectSix.routesubject6, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance6,
      'Subject': userData.subject6,
      'uid': userData.uid,
    });
  }

  void subject7(context, userData) {
    Navigator.of(context).pushNamed(SubjectSeven.routesubject7, arguments: {
      'name': userData.name,
      'SID': userData.sid,
      'Attendance': userData.attendance7,
      'Subject': userData.subject7,
      'uid': userData.uid,
    });
  }

}
