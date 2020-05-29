import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './database.dart';
import './Teacher/teacher_inside_page.dart';
import './Teacher/databaseteacher.dart';

class SignUp extends StatefulWidget {
  final screenHeight;

  SignUp(this.screenHeight);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password,_uniquepassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      if(_uniquepassword==null){
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password); //as FirebaseUser;
        //Navigate to new page
        FirebaseUser user = result.user;
        await DatabaseService(uid: user.uid).updateUserData(
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            'Your Name',
            '1810....',
            1,
            'subject1',
            'subject2',
            'subject3',
            'subject4',
            'subject5',
            'subject6',
            'subject7');
        setState(() {});
      } catch (e) {
        print(e.message);
      }
    }

else{
   try {
        AuthResult teacher_result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password); //as FirebaseUser;
        //Navigate to new page
        FirebaseUser teacheruser = teacher_result.user;
        await TeacherdatabaseService(uid: teacheruser.uid).updateUserData(
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            'Your Name',
            'subject1',
            'subject2',
            'subject3',
            'subject4',
            'subject5',
            'subject6',
            'subject7');
        setState(() {});
      } catch (e) {
        print(e.message);
      }

}

    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
               
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "UserName", hasFloatingPlaceholder: true),
           
                    validator: (input) {
                      if (input.isEmpty) {
                        return "please type email";
                      }
                    },
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                    
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                    obscureText: true,
                   
                    validator: (input) {
                      if (input.length < 8) {
                        return "Your password needs to be atleast 8";
                      }
                    },
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),


                    TextFormField(
                    decoration: InputDecoration(
                        labelText: "For teacher Only", hasFloatingPlaceholder: true),
                    obscureText: true,
                   
                   
                    onChanged: (val) {
                      setState(() => _uniquepassword = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: signup,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
