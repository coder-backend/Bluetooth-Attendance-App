
import 'package:bluetooth_app/pages/Teacher/Teacher_bluetooth/t_bluetooth7.dart';

import './inside_page.dart';
import 'package:flutter/material.dart';
import './sign_in.dart';
import './signup.dart';
import '../subject_Screen/bluetooth.dart';
import '../subject_Screen/subject1.dart';
import '../subject_Screen/subject2.dart';
import '../subject_Screen/subject3.dart';
import '../subject_Screen/subject4.dart';
import '../subject_Screen/subject5.dart';
import '../subject_Screen/subject6.dart';
import '../subject_Screen/subject7.dart';
import '../subject_Screen/bluetooth2.dart';
import '../subject_Screen/bluetooth3.dart';
import '../subject_Screen/bluetooth4.dart';
import '../subject_Screen/bluetooth5.dart';
import '../subject_Screen/bluetooth6.dart';
import '../subject_Screen/bluetooth7.dart';
import './Teacher/teacher_inside_page.dart';
import './Teacher/teacherSubject.dart/t_subject1.dart';
import './Teacher/teacherSubject.dart/t_subject2.dart';
import './Teacher/teacherSubject.dart/t_subject3.dart';
import './Teacher/teacherSubject.dart/t_subject4.dart';
import './Teacher/teacherSubject.dart/t_subject5.dart';
import './Teacher/teacherSubject.dart/t_subject6.dart';
import './Teacher/teacherSubject.dart/t_subject7.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth2.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth3.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth4.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth5.dart';
import './Teacher/Teacher_bluetooth/t_bluetooth6.dart';


void main() => runApp(MyApp());

enum AuthMode { LOGIN, SINGUP }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        InsidePage.routeName: (ctx) => InsidePage(),
        TeacherInsidePage.teacherrouteName:(ctx)=>TeacherInsidePage(),
        BluetoothApp.routebluetooth: (ctx) => BluetoothApp(),
        BluetoothApp2.routebluetooth2: (ctx) => BluetoothApp2(),
        BluetoothApp3.routebluetooth3: (ctx) => BluetoothApp3(),
        BluetoothApp4.routebluetooth4: (ctx) => BluetoothApp4(),
        BluetoothApp5.routebluetooth5: (ctx) => BluetoothApp5(),
        BluetoothApp6.routebluetooth6: (ctx) => BluetoothApp6(),
        BluetoothApp7.routebluetooth7: (ctx) => BluetoothApp7(),
        SubjectOne.routesubject1: (ctx) => SubjectOne(),
        SubjectTwo.routesubject2: (ctx) => SubjectTwo(),
        SubjectThree.routesubject3: (ctx) => SubjectThree(),
        SubjectFour.routesubject4: (ctx) => SubjectFour(),
        SubjectFive.routesubject5: (ctx) => SubjectFive(),
        SubjectSix.routesubject6: (ctx) => SubjectSix(),
        SubjectSeven.routesubject7: (ctx) => SubjectSeven(),
        TeacherSubjectOne.troutesubject1:(ctx)=>TeacherSubjectOne(),
        TSubjectTwo.troutesubject2:(ctx)=>TSubjectTwo(),
        TSubjectThree.troutesubject3:(ctx)=>TSubjectThree(),
        TSubjectFour.troutesubject4:(ctx)=>TSubjectFour(),
        TSubjectFive.troutesubject5:(ctx)=>TSubjectFive(),
        TSubjectSix.troutesubject6:(ctx)=>TSubjectSix(),
        TSubjectSeven.troutesubject7:(ctx)=>TSubjectSeven(),
        TBluetoothApp.troutebluetooth:(ctx)=>TBluetoothApp(),
        TBluetoothApp2.troutebluetooth2:(ctx)=>TBluetoothApp2(),
        TBluetoothApp3.troutebluetooth3:(ctx)=>TBluetoothApp3(),
        TBluetoothApp4.troutebluetooth4:(ctx)=>TBluetoothApp4(),
        TBluetoothApp5.troutebluetooth5:(ctx)=>TBluetoothApp5(),
        TBluetoothApp6.troutebluetooth6:(ctx)=>TBluetoothApp6(),
        TBluetoothApp7.troutebluetooth7:(ctx)=>TBluetoothApp7(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  double screenHeight;

  // Set intial mode to login
  AuthMode _authMode = AuthMode.LOGIN;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                lowerHalf(context),
                upperHalf(context),
                _authMode == AuthMode.LOGIN
                    ? loginCard(context)
                    : singUpCard(context),
                pageTitle(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.home,
            size: 48,
            color: Colors.white,
          ),
          Text(
            "Attendance",
            style: TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget loginCard(BuildContext context) {
    return Column(
      children: <Widget>[
        SignIn(screenHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Don't have an account ?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.SINGUP;
                });
              },
              textColor: Colors.black87,
              child: Text("Create Account"),
            )
          ],
        )
      ],
    );
  }

  Widget singUpCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight / 5),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          SignUp(screenHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Already have an account?",
                style: TextStyle(color: Colors.grey),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _authMode = AuthMode.LOGIN;
                  });
                },
                textColor: Colors.black87,
                child: Text("Login"),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/images/pec1.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }
}
