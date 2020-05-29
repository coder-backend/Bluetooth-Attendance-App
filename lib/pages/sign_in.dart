import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './inside_page.dart';
import './Teacher/databaseteacher.dart';
import './Teacher/teacher_inside_page.dart';

class SignIn extends StatefulWidget {
  final screenHeight;
  SignIn(this.screenHeight);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password,_uniquepassword;

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.screenHeight / 4),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Form(
        key: _formKey,
      
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
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
                  // controller: password,
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
                      labelText: "teacher Only", hasFloatingPlaceholder: true),
                  obscureText: true,
                  // controller: password,
                
                  onChanged: (val) {
                    setState(() => _uniquepassword = val);
                  },
                 
                
                ),
              
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      child: Text("Forgot Password ?"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FlatButton(
                      child: Text("Login"),
                      color: Color(0xFF4B9DFE),
                      textColor: Colors.white,
                      padding: EdgeInsets.only(
                          left: 38, right: 38, top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        return signin(context);
                      },
                    ),
                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signin(context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      if(_uniquepassword==null){
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email, password: _password); 
        
        FirebaseUser user = result.user;

        //
        print('Your your id is:');
        print(user.uid);
        Navigator.of(context).pushNamed(InsidePage.routeName, arguments: {
          'email': _email,
          'password': _password,
          'uid': user.uid,
        });
      } catch (e) {
        print(e.message);
      }
     
    }
    
    else{


      try {
        AuthResult teacher_result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email, password: _password); 
        
        FirebaseUser teacheruser = teacher_result.user;

        //
        print('Your your id is:');
        print(teacheruser.uid);
        Navigator.of(context).pushNamed(TeacherInsidePage.teacherrouteName, arguments: {
          'email': _email,
          'password': _password,
          'uid': teacheruser.uid,
        });
      } catch (e) {
        print(e.message);
      }
    }
  }
  }
}
