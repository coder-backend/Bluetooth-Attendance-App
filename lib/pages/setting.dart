import 'package:bluetooth_app/pages/database.dart';
import 'package:flutter/material.dart';
import './userData.dart';
import './database.dart';

class SettingForm extends StatefulWidget {
  final String uid;
  SettingForm({this.uid});
  @override
  _SettingFormState createState() => _SettingFormState(uid: uid);
}

class _SettingFormState extends State<SettingForm> {
  final String uid;
  _SettingFormState({this.uid});

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
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Update your Info...', style: TextStyle(fontSize: 18.0)),
                SizedBox(height: 25),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.sid,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your SID";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSID = val);
                  },
                ),
                SizedBox(height: 15),
                 TextFormField(
                  initialValue: userData.name,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Name";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentName = val);
                  },
                ),
                SizedBox(height: 15),
                Text('Select Your Semester'),
                DropdownButtonFormField(
                  value: _currentSemester,
                  items: semester.map((sem) {
                    return DropdownMenuItem(
                      value: sem,
                      child: Text('$sem'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSemester = val),
                ),
                TextFormField(
                  initialValue: userData.subject1,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject1 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject2,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject2 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject3,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject3 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject4,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject4 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject5,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject5 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject6,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject6 = val);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  initialValue: userData.subject7,
                  decoration: InputDecoration(hasFloatingPlaceholder: true),
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please Enter your Subject";
                    }
                  },
                  onChanged: (val) {
                    setState(() => _currentSubject7 = val);
                  },
                ),
                SizedBox(height: 15),
                FlatButton(
                  child: Text("Update"),
                  color: Color(0xFF4B9DFE),
                  textColor: Colors.white,
                  padding:
                      EdgeInsets.only(left: 38, right: 38, top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseService(uid: uid).updateUserData(
                          userData.attendance1,
                          userData.attendance2,
                          userData.attendance3,
                          userData.attendance4,
                          userData.attendance5,
                          userData.attendance6,
                          userData.attendance7,
                          _currentName ?? userData.name,
                          _currentSID ?? userData.sid,
                          _currentSemester ?? userData.semester,
                          _currentSubject1 ?? userData.subject1,
                          _currentSubject2 ?? userData.subject2,
                          _currentSubject3 ?? userData.subject3,
                          _currentSubject4 ?? userData.subject4,
                          _currentSubject5 ?? userData.subject5,
                          _currentSubject6 ?? userData.subject6,
                          _currentSubject7 ?? userData.subject7,
                          );
                          Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Container(child: Text('you got an error'));
        }
      },
    );
  }
}
