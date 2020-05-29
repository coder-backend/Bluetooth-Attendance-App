import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Imagesinput extends StatefulWidget {
  String fileName;
  @override
  _ImagesinputState createState() => _ImagesinputState(fileName);
}

class _ImagesinputState extends State<Imagesinput> {
  String fileName;
  _ImagesinputState(fileName);
  File _imageFile;
  Future _getImage(BuildContext context, ImageSource source) async {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      Navigator.pop(context);
    });
  }

  Future uploadPic(BuildContext context) async {
    fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture Uploaded");
      print(_imageFile);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded'),));
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Pick an Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                child: Text(
                  'Use Camera',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  _getImage(context, ImageSource.camera);
                },
              ),
              SizedBox(height: 5.0),
              FlatButton(
                onPressed: () {
                  _getImage(context, ImageSource.gallery);
                },
                child: Text(
                  'From Gallery',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.blueAccent,
            child: ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: (_imageFile == null)
                    ? Image.network(
                        "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                        fit: BoxFit.fill)
                    : Image.file(_imageFile, fit: BoxFit.fill),
              ),
            ),
           
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FlatButton.icon(
              onPressed: () {
                _openImagePicker(context);
              },
              icon: Icon(Icons.camera_alt),
              label: Text('')),
        ),
        Align(
           alignment: Alignment.topCenter,
          child: FlatButton(
            child: Text("ADD PHOTO"),
              onPressed: () {
               uploadPic(context) ;
              },
             
        ),
        ),
      ],
    );
  }
}
