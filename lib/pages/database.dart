//import 'dart:html';
import 'package:bluetooth_app/pages/Subject_code.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './userData.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference subject = Firestore.instance.collection('Students');

  Future updateUserData(
      int attendance1,
      int attendance2,
      int attendance3,
      int attendance4,
      int attendance5,
      int attendance6,
      int attendance7,
      String name,
      String sid,
      int semester,
      String subject1,
      String subject2,
      String subject3,
      String subject4,
      String subject5,
      String subject6,
      String subject7) async {
    return await subject.document(uid).setData({
      'Attendance Subject1': attendance1,
      'Attendance Subject2': attendance2,
      'Attendance Subject3': attendance3,
      'Attendance Subject4': attendance4,
      'Attendance Subject5': attendance5,
      'Attendance Subject6': attendance6,
      'Attendance Subject7': attendance7,
      'Name': name,
      'SID': sid,
      'Semester': semester,
      'Subject1': subject1,
      'Subject2': subject2,
      'Subject3': subject3,
      'Subject4': subject4,
      'Subject5': subject5,
      'Subject6': subject6,
      'Subject7': subject7,
    });
  }

  List<Subject_Code> _studentdetailsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Subject_Code(
        attendance1: doc.data['Attendance Subject1'] ?? 0,
        attendance2: doc.data['Attendance Subject2'] ?? 0,
        attendance3: doc.data['Attendance Subject3'] ?? 0,
        attendance4: doc.data['Attendance Subject4'] ?? 0,
        attendance5: doc.data['Attendance Subject5'] ?? 0,
        attendance6: doc.data['Attendance Subject6'] ?? 0,
        attendance7: doc.data['Attendance Subject7'] ?? 0,
        name: doc.data['Name'] ?? '0',
        sid: doc.data['SID'] ?? '0',
        semester: doc.data['Semester'] ?? 0,
        subject1: doc.data['Subject1'] ?? '0',
        subject2: doc.data['Subject2'] ?? '0',
        subject3: doc.data['Subject3'] ?? '0',
        subject4: doc.data['Subject4'] ?? '0',
        subject5: doc.data['Subject5'] ?? '0',
        subject6: doc.data['Subject6'] ?? '0',
        subject7: doc.data['Subject7'] ?? '0',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      attendance1: snapshot.data['Attendance Subject1'],
      attendance2: snapshot.data['Attendance Subject2'],
      attendance3: snapshot.data['Attendance Subject3'],
      attendance4: snapshot.data['Attendance Subject4'],
      attendance5: snapshot.data['Attendance Subject5'],
      attendance6: snapshot.data['Attendance Subject6'],
      attendance7: snapshot.data['Attendance Subject7'],
      name: snapshot.data['Name'],
      sid: snapshot.data['SID'],
      semester: snapshot.data['Semester'],
      subject1: snapshot.data['Subject1'],
      subject2: snapshot.data['Subject2'],
      subject3: snapshot.data['Subject3'],
      subject4: snapshot.data['Subject4'],
      subject5: snapshot.data['Subject5'],
      subject6: snapshot.data['Subject6'],
      subject7: snapshot.data['Subject7'],
    );
  }

  Stream<List<Subject_Code>> get subject_code {
    return subject.snapshots().map(_studentdetailsFromSnapshot);
  }

  //get user document
  Stream<UserData> get userData {
    return subject.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
