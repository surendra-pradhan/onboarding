import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddOwnerScreen extends StatefulWidget {
  static const routerName = '/addowner';
  const AddOwnerScreen({Key? key}) : super(key: key);

  @override
  _AddOwnerScreenState createState() => _AddOwnerScreenState();
}

class _AddOwnerScreenState extends State<AddOwnerScreen> {
  final _key = GlobalKey<FormState>();

  Map<String, dynamic> ownerData = {
    "firstname": "",
    "lastname": "",
    "email": "",
    "phone": null,
    "type": ["owner"],
    "PAN": ""
  };

  void _submitData() {
    _key.currentState!.save();
    Provider.of<DataProvider>(context, listen: false)
        .addOwner(ownerData, _storedImage!.path);
  }

  XFile? _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final imageFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _storedImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Owner'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text('First Name')),
                    onSaved: (val) {
                      ownerData = {
                        "firstname": val,
                        "lastname": ownerData['lastname'],
                        "email": ownerData['email'],
                        "phone": ownerData['phone'],
                        "type": ownerData['type'],
                        "PAN": ownerData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Last Name')),
                    onSaved: (val) {
                      ownerData = {
                        "firstname": ownerData['firstname'],
                        "lastname": val,
                        "email": ownerData['email'],
                        "phone": ownerData['phone'],
                        "type": ownerData['type'],
                        "PAN": ownerData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Email')),
                    onSaved: (val) {
                      ownerData = {
                        "firstname": ownerData['firstname'],
                        "lastname": ownerData['lastname'],
                        "email": val,
                        "phone": ownerData['phone'],
                        "type": ownerData['type'],
                        "PAN": ownerData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Phone')),
                    keyboardType: TextInputType.number,
                    onSaved: (val) {
                      ownerData = {
                        "firstname": ownerData['firstname'],
                        "lastname": ownerData['lastname'],
                        "email": ownerData['email'],
                        "phone": val,
                        "type": ownerData['type'],
                        "PAN": ownerData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Pan')),
                    onSaved: (val) {
                      ownerData = {
                        "firstname": ownerData['firstname'],
                        "lastname": ownerData['lastname'],
                        "email": ownerData['email'],
                        "phone": ownerData['phone'],
                        "type": ownerData['type'],
                        "PAN": val
                      };
                    },
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: _storedImage != null
                        ? Image.file(File(_storedImage!.path))
                        : Text('click a image'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: _takePicture, child: Text('Take Pic')),
                  ElevatedButton(onPressed: _submitData, child: Text('Save'))
                ],
              )),
        ),
      ),
    );
  }
}
