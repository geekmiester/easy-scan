import 'dart:io';
import 'package:EasyScan/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  File _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyScan'),
      ),
      body: Center(
          child: OutlineButton(
        onPressed: _showImagePicker,
        child: Text('Choose image'),
      )),
    );
  }

  void _showImagePicker() async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 35,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Choose Source',
                style: text_style.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              onTap: _getImageFromSource,
              leading: Icon(Icons.camera_alt),
              title: Text("From Camera"),
            ),
            ListTile(
                onTap: () {
                  Navigator.pop(context);
                  //TODO:open bottomsheet showing device images using storage_path package
                },
                leading: Icon(Icons.image),
                title: Text("From Gallery")),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0)),
          ),
        );
      },
    );
  }

  void _getImageFromSource() async {
    Navigator.pop(context);
    var _pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (_pickedFile != null) {
      setState(() {
        this._imageFile = File(_pickedFile.path);
      });
    }
  }
}
