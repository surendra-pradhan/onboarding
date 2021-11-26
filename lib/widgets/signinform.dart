import 'package:flutter/material.dart';
import 'package:onboarding/providers/authprovider.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  Map<String, dynamic> _formdata = {'username': '', 'password': ''};

  final _key = GlobalKey<FormState>();

  Future _signIn() async {
    _key.currentState!.save();
    await Provider.of<Authprovider>(context, listen: false)
        .login(_formdata['username'], _formdata['password']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                initialValue: 'spradh909',
                decoration: InputDecoration(label: Text('User Name')),
                onSaved: (data) {
                  _formdata = {
                    'username': data,
                    'password': _formdata['password']
                  };
                },
              ),
              TextFormField(
                initialValue: '9X8a',
                decoration: InputDecoration(label: Text('Password')),
                onSaved: (data) {
                  _formdata = {
                    'username': _formdata['username'],
                    'password': data
                  };
                },
              ),
              ElevatedButton(onPressed: _signIn, child: Text('Sign In'))
            ],
          )),
    ));
  }
}
