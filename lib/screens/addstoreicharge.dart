import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:provider/provider.dart';

class AddStoreIncharge extends StatefulWidget {
  static const routerName = '/AddStoreIncharge';

  const AddStoreIncharge({Key? key}) : super(key: key);

  @override
  _AddStoreInchargeState createState() => _AddStoreInchargeState();
}

class _AddStoreInchargeState extends State<AddStoreIncharge> {
  final _key = GlobalKey<FormState>();

  Map<String, dynamic> storeData = {
    "firstname": "",
    "lastname": "",
    "email": "",
    "phone": null,
    "type": ["storeincharge"],
    "PAN": ""
  };

  void _submitData() {
    _key.currentState!.save();
    Provider.of<DataProvider>(context, listen: false)
        .addOwner(storeData, _storedImage!.path);
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
        title: Text('Add Store Incharge'),
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
                      storeData = {
                        "firstname": val,
                        "lastname": storeData['lastname'],
                        "email": storeData['email'],
                        "phone": storeData['phone'],
                        "type": storeData['type'],
                        "PAN": storeData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Last Name')),
                    onSaved: (val) {
                      storeData = {
                        "firstname": storeData['firstname'],
                        "lastname": val,
                        "email": storeData['email'],
                        "phone": storeData['phone'],
                        "type": storeData['type'],
                        "PAN": storeData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Email')),
                    onSaved: (val) {
                      storeData = {
                        "firstname": storeData['firstname'],
                        "lastname": storeData['lastname'],
                        "email": val,
                        "phone": storeData['phone'],
                        "type": storeData['type'],
                        "PAN": storeData['PAN']
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
                      storeData = {
                        "firstname": storeData['firstname'],
                        "lastname": storeData['lastname'],
                        "email": storeData['email'],
                        "phone": val,
                        "type": storeData['type'],
                        "PAN": storeData['PAN']
                      };
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Pan')),
                    onSaved: (val) {
                      storeData = {
                        "firstname": storeData['firstname'],
                        "lastname": storeData['lastname'],
                        "email": storeData['email'],
                        "phone": storeData['phone'],
                        "type": storeData['type'],
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
