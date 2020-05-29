//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './Teacherdata.dart';
import './Teacherupdate.dart';

class TeacherdatabaseService {
  final String uid;

  TeacherdatabaseService({this.uid});

  final CollectionReference storeData = Firestore.instance.collection('Teacher');

  Future updateUserData(
      int attendance1,
      int attendance2,
      int attendance3,
      int attendance4,
      int attendance5,
      int attendance6,
      int attendance7,
      String name,
    
      String subject1,
      String subject2,
      String subject3,
      String subject4,
      String subject5,
      String subject6,
      String subject7) async {
    return await storeData.document(uid).setData({
      'Total Class in Subject1': attendance1,
      'Total Class in Subject2': attendance2,
      'Total Class in Subject3': attendance3,
      'Total Class in Subject4': attendance4,
      'Total Class in Subject5': attendance5,
      'Total Class in Subject6': attendance6,
      'Total Class in Subject7': attendance7,
      'Name': name,
      'Subject1': subject1,
      'Subject2': subject2,
      'Subject3': subject3,
      'Subject4': subject4,
      'Subject5': subject5,
      'Subject6': subject6,
      'Subject7': subject7,
    });
  }

  List<Teacher_Data> _teacherdetailsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Teacher_Data(
        attendance1: doc.data['Total Class in Subject1'] ?? 0,
        attendance2: doc.data['Total Class in Subject2'] ?? 0,
        attendance3: doc.data['Total Class in Subject3'] ?? 0,
        attendance4: doc.data['Total Class in Subject4'] ?? 0,
        attendance5: doc.data['Total Class in Subject5'] ?? 0,
        attendance6: doc.data['Total Class in Subject6'] ?? 0,
        attendance7: doc.data['Total Class in Subject7'] ?? 0,
        name: doc.data['Name'] ?? '0',
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

  TeacherData _teacheruserDataFromSnapshot(DocumentSnapshot snapshot) {
    return TeacherData(
      uid: uid,
      attendance1: snapshot.data['Total Class in Subject1'],
      attendance2: snapshot.data['Total Class in Subject2'],
      attendance3: snapshot.data['Total Class in Subject3'],
      attendance4: snapshot.data['Total Class in Subject4'],
      attendance5: snapshot.data['Total Class in Subject5'],
      attendance6: snapshot.data['Total Class in Subject6'],
      attendance7: snapshot.data['Total Class in Subject7'],
      name: snapshot.data['Name'],
      subject1: snapshot.data['Subject1'],
      subject2: snapshot.data['Subject2'],
      subject3: snapshot.data['Subject3'],
      subject4: snapshot.data['Subject4'],
      subject5: snapshot.data['Subject5'],
      subject6: snapshot.data['Subject6'],
      subject7: snapshot.data['Subject7'],
    );
  }

  Stream<List<Teacher_Data>> get store {
    return storeData.snapshots().map(_teacherdetailsFromSnapshot);
  }

  //get user document
  Stream<TeacherData> get userData {
    return storeData.document(uid).snapshots().map(_teacheruserDataFromSnapshot);
  }
}
